require 'trackable'
require 'formatable'
require 'exceptions'

class PurchasesController < ApplicationController
  layout "purchase"
  #load_and_authorize_resource 
  include Trackable
  include Formatable
  include Exceptions

  def new
    #@purchase = Retailer.new
    #@purchase = Retailer.new
    @customer = Customer.new
    @customer.fyis.build
    @customer.todos.build
    @customer.addresses.build 
    @customer.orders.build 
    @customer.orders[0].fyis.build 

    5.times do 
     @customer.orders[0].line_items.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end
  def create
    @purchase = Purchase.new(params, current_user)
    respond_to do |format|
      if @purchase.save
        format.html { redirect_to @purchase.customer, notice: 'Order was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  rescue Exceptions::ExcessiveDiscountAmount => exc    
    logger.error "----> purchase.create excessive-discount exc: #{exc}"
    flash[:error] = 'Discount cannot be more than the total order amount.'
    @customer = Customer.new(params[:customer])
    render :action => 'new'
  rescue Exception => exc
   logger.error "----> purchase.create exc: #{exc}"
   flash[:error] = 'There was an unexpected error in your order. Email Joel at jwshin@gmail.com'
   @customer = Customer.new(params[:customer])
   render :action => 'new'    
  end

=begin
  def update
    #@purchase = Retailer.find(params[:id])
    @purchase.updater = current_user

    respond_to do |format|
      if @purchase.update_attributes(params[:purchase])
        format.html { redirect_to @purchase, notice: 'Retailer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@purchase = Retailer.find(params[:id])
    @purchase.destroy

    respond_to do |format|
      format.html { redirect_to purchases_url }
      format.json { head :no_content }
    end
  end
=end
end

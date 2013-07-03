require 'trackable'
require 'formatable'

class PurchasesController < ApplicationController
  layout "purchase"
  #load_and_authorize_resource 
  include Trackable
  include Formatable

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

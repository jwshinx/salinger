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
    @customer = Customer.new(params[:customer])
    set_creator_and_updater @customer, current_user 
    @customer.fyis.each { |f| set_creator_and_updater f, current_user }
    @customer.todos.each { |t| set_creator_and_updater t, current_user }
    @customer.addresses.each { |a| set_creator_and_updater a, current_user }
    @customer.orders.each do |o| 
     o.fyis.each { |ofyi| set_creator_and_updater ofyi, current_user }
     o.paid_amount = convert_dollars_to_cents( params[:customer][:orders_attributes]['0'][:paid_amount] )
     order_total = 0
     set_creator_and_updater o, current_user
     o.line_items.each_with_index do |oli, i|
      set_creator_and_updater oli, current_user
      price = Product.find(params[:customer][:orders_attributes]['0'][:line_items_attributes][i.to_s][:product_id]).price 
      oli.price = price 
      quantity = params[:customer][:orders_attributes]['0'][:line_items_attributes][i.to_s][:quantity].to_i
      order_total += price * quantity
      oli.subtotal = price * quantity 
     end
     o.purchase_amount = order_total 
    end

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Order was successfully created.' }
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

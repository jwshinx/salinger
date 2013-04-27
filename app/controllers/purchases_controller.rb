class PurchasesController < ApplicationController
  layout "purchase"
  #load_and_authorize_resource 

  def new
    #@purchase = Retailer.new
    #@purchase = Retailer.new
    @customer = Customer.new
    @customer.fyis.build
    @customer.todos.build
    @customer.orders.build
    @customer.orders[0].line_items.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase }
    end
  end

  def create
    logger.debug "---> PC.create 0"
    #@purchase = Retailer.new(params[:purchase])
    @customer = Customer.new(params[:customer])
    @customer.creator = current_user
    @customer.updater = current_user
    logger.debug "---> PC.create 1"
    @customer.fyis.each do |f| 
     f.creator = current_user 
     f.updater = current_user 
    end
    logger.debug "---> PC.create 2"
    @customer.todos.each do |t| 
     t.creator = current_user 
     t.updater = current_user 
    end
    logger.debug "---> PC.create 3"
    @customer.orders.each do |o| 
     order_total = 0
     o.creator = current_user 
     o.updater = current_user 
     o.line_items.each do |oli|
      oli.creator = current_user 
      oli.updater = current_user 
      price = Product.find(params[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:product_id]).price 
      logger.debug "---> PC.create 3.1 price: #{price}"
      oli.price = price 
      quantity = params[:customer][:orders_attributes]['0'][:line_items_attributes]['0'][:quantity].to_i
      logger.debug "---> PC.create 3.2 quantity: #{quantity}"
      order_total += price * quantity
      oli.subtotal = price * quantity 
     end
     o.purchase_amount = order_total 
    end
    logger.debug "---> PC.create 4"

    respond_to do |format|
      if @customer.save
        logger.debug "---> PC.create 5"
        format.html { redirect_to @customer, notice: 'Purchase was successfully created.' }
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

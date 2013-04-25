class OrdersController < ApplicationController
  layout "order"
  load_and_authorize_resource

  def index
    #@orders = Order.all
    @order_line_items = OrderLineItem.order('created_at desc').includes(:order).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def show
    #@order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  def new
    #@order = Order.new
    @order.line_items.build
    @customer = Customer.find params[:customer_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  def edit
    #@order = Order.find(params[:id])
    @customer = Customer.find params[:customer_id]
  end

  def create
    logger.debug "---> OC.create 0"
    logger.debug "---> OC.create 0.1: #{@order.inspect}"
    #@order = Order.new(params[:order])
    logger.debug "---> OC.create 0.2: #{@order.line_items.empty?}"
    logger.debug "---> OC.create 0.3: #{@order.line_items.first.inspect}"
    @order.creator = current_user
    @order.updater = current_user

    logger.debug "---> OC.create 0.4: #{@order.inspect}"
    logger.debug "---> OC.create 1"
    @order.line_items.each do |li|
     li.creator = current_user 
     li.updater = current_user 
     li.price = li.product.price 
     li.subtotal = li.product.price * li.quantity
    end
    logger.debug "---> OC.create 2.1: #{@order.line_items.first.inspect}"

    if @order.save
     #redirect_to customers_orders_url(@order.customer, @order), notice: 'Order was successfully created.' 
     flash[:notice] = 'Order was successfully created.' 
     #redirect_to customers_orders_url(@order.customer, @order) 
     redirect_to customers_url
    else
     render action: "new_customer_order" 
    end
  end

  def update
    #@order = Order.find(params[:id])
    @order.updater = current_user
    @order.line_items.each { |li| li.updater == current_user  }

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end

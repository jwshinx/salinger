class OrdersController < ApplicationController
  layout "order"
  load_and_authorize_resource
  include Trackable
  
  def index
    @orders = Order.order('created_at desc').includes(:line_items).all

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
    #@order = Order.new(params[:order])
    set_creator_and_updater @order, current_user    
    @order.line_items.each do |li|
      set_creator_and_updater li, current_user    
      li.price = li.product.price 
      li.subtotal = li.product.price * li.quantity
    end

    if @order.save
     flash[:notice] = 'Order was successfully created.' 
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

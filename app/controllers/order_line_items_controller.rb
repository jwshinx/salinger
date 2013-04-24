class OrderLineItemsController < ApplicationController
  # GET /order_line_items
  # GET /order_line_items.json
  def index
    @order_line_items = OrderLineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_line_items }
    end
  end

  # GET /order_line_items/1
  # GET /order_line_items/1.json
  def show
    @order_line_item = OrderLineItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_line_item }
    end
  end

  # GET /order_line_items/new
  # GET /order_line_items/new.json
  def new
    @order_line_item = OrderLineItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_line_item }
    end
  end

  # GET /order_line_items/1/edit
  def edit
    @order_line_item = OrderLineItem.find(params[:id])
  end

  # POST /order_line_items
  # POST /order_line_items.json
  def create
    @order_line_item = OrderLineItem.new(params[:order_line_item])

    respond_to do |format|
      if @order_line_item.save
        format.html { redirect_to @order_line_item, notice: 'Order line item was successfully created.' }
        format.json { render json: @order_line_item, status: :created, location: @order_line_item }
      else
        format.html { render action: "new" }
        format.json { render json: @order_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_line_items/1
  # PUT /order_line_items/1.json
  def update
    @order_line_item = OrderLineItem.find(params[:id])

    respond_to do |format|
      if @order_line_item.update_attributes(params[:order_line_item])
        format.html { redirect_to @order_line_item, notice: 'Order line item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_line_items/1
  # DELETE /order_line_items/1.json
  def destroy
    @order_line_item = OrderLineItem.find(params[:id])
    @order_line_item.destroy

    respond_to do |format|
      format.html { redirect_to order_line_items_url }
      format.json { head :no_content }
    end
  end
end

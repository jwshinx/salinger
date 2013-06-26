class OrderStatusesController < ApplicationController
  layout 'order_status'
  load_and_authorize_resource

  def index
    #@order_statuses = OrderStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_statuses }
    end
  end

  def show
    #@order_status = OrderStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_status }
    end
  end

  def new
    #@order_status = OrderStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_status }
    end
  end

  def edit
    #@order_status = OrderStatus.find(params[:id])
  end

  def create
    #@order_status = OrderStatus.new(params[:order_status])
    @order_status.creator = current_user
    @order_status.updater = current_user

    respond_to do |format|
      if @order_status.save
        format.html { redirect_to @order_status, notice: 'Order status was successfully created.' }
        format.json { render json: @order_status, status: :created, location: @order_status }
      else
        format.html { render action: "new" }
        format.json { render json: @order_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@order_status = OrderStatus.find(params[:id])
    @order_status.updater = current_user

    respond_to do |format|
      if @order_status.update_attributes(params[:order_status])
        format.html { redirect_to @order_status, notice: 'Order status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_status.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@order_status = OrderStatus.find(params[:id])
    @order_status.destroy

    respond_to do |format|
      format.html { redirect_to order_statuses_url }
      format.json { head :no_content }
    end
  end
end

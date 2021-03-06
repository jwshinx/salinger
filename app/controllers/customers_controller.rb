class CustomersController < ApplicationController
  layout 'customer'
  load_and_authorize_resource
  include Trackable
  
  def index
    #@customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end

  def show    
    @customer = Customer.includes(:orders, :addresses, :todos, :fyis).find(params[:id])
    @orders = @customer.orders.order('created_at desc').includes(:line_items).all
    @customer_addresses = @customer.addresses.all
    @notes = @customer.todos_and_fyis

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

  def new
    #@customer = Customer.new
    @customer.todos.build
    @customer.fyis.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end

  def edit
    #@customer = Customer.find(params[:id])
  end

  def create
    #@customer = Customer.new(params[:customer])
    set_creator_and_updater @customer, current_user    
    @customer.fyis.each { |f| set_creator_and_updater f, current_user }   
    @customer.todos.each { |f| set_creator_and_updater f, current_user }   
    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render json: @customer, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@customer = Customer.find(params[:id])
    @customer.updater = current_user
    @customer.todos.each { |t| t.updater = current_user }

    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@customer = Customer.find(params[:id])
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
end

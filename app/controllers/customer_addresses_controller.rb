class CustomerAddressesController < ApplicationController
  layout 'customer_address'
  load_and_authorize_resource

  def index
    #@customer_addresses = CustomerAddress.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customer_addresses }
    end
  end

  def show
    #@customer_address = CustomerAddress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer_address }
    end
  end

  def new
    #@customer_address = CustomerAddress.new
    @customer = Customer.find params[:customer_id] 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer_address }
    end
  end

  def edit
    #@customer_address = CustomerAddress.find(params[:id])
    @customer = Customer.find params[:customer_id] 
  end

  def create
    #@customer_address = CustomerAddress.new(params[:customer_address])
    
    @customer_address.creator = current_user
    @customer_address.updater = current_user

    respond_to do |format|
      if @customer_address.save
        format.html { redirect_to customer_url(@customer_address.customer), notice: 'Customer address was successfully created.' }
        format.json { render json: @customer_address, status: :created, location: @customer_address }
      else
        @customer = Customer.find( params[:customer_id])
        format.html { render action: "new" }
        format.json { render json: @customer_address.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@customer_address = CustomerAddress.find(params[:id])
    @customer_address.updater = current_user

    respond_to do |format|
      if @customer_address.update_attributes(params[:customer_address])
        format.html { redirect_to @customer_address, notice: 'Customer address was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @customer_address.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@customer_address = CustomerAddress.find(params[:id])
    @customer_address.destroy

    respond_to do |format|
      format.html { redirect_to customer_addresses_url }
      format.json { head :no_content }
    end
  end
end

class AddressTypesController < ApplicationController
  layout 'address_type'
  load_and_authorize_resource
  include Trackable

  def index
    #@address_types = AddressType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @address_types }
    end
  end

  def show
    #@address_type = AddressType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address_type }
    end
  end

  def new
    #@address_type = AddressType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address_type }
    end
  end

  def edit
    #@address_type = AddressType.find(params[:id])
  end

  def create
    #@address_type = AddressType.new(params[:address_type])
    set_creator_and_updater @address_type, current_user    
    respond_to do |format|
      if @address_type.save
        format.html { redirect_to @address_type, notice: 'Address type was successfully created.' }
        format.json { render json: @address_type, status: :created, location: @address_type }
      else
        format.html { render action: "new" }
        format.json { render json: @address_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@address_type = AddressType.find(params[:id])
    @address_type.updater = current_user

    respond_to do |format|
      if @address_type.update_attributes(params[:address_type])
        format.html { redirect_to @address_type, notice: 'Address type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address_type.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@address_type = AddressType.find(params[:id])
    @address_type.destroy

    respond_to do |format|
      format.html { redirect_to address_types_url }
      format.json { head :no_content }
    end
  end
end

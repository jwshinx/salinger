require 'formatable'

class FabricsController < ApplicationController
  layout "fabric"
  load_and_authorize_resource
  include Formatable

  def index
    #@fabrics = Fabric.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fabrics }
    end
  end

  def show
    @fabric = Fabric.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fabric }
    end
  end

  def new
    #@fabric = Fabric.new
    @fabric.prices.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fabric }
    end
  end

  def edit
    #@fabric = Fabric.find(params[:id])
  end

  def create
    logger.debug "---> 1"
    #@fabric = Fabric.new(params[:fabric])
    @fabric.creator = current_user
    @fabric.updater = current_user
    logger.debug "---> 2: #{@fabric.inspect}"
    @fabric.prices.each do |p| 
     p.creator = current_user 
     p.updater = current_user
     logger.debug "---> 2.01: #{params[:fabric][:prices_attributes]['0'][:amount]}"
     p.amount = convert_dollars_to_cents( params[:fabric][:prices_attributes]['0'][:amount] )
     logger.debug "---> 2.02: #{p.amount}"
     p.date = Date.parse(params[:fabric][:prices_attributes]['0'][:date]) 
    end
    logger.debug "---> 2.1: #{@fabric.inspect}"
    logger.debug "---> 2.2: #{@fabric.prices.inspect}"
    logger.debug "---> 3"
    #@fabric.prices = convert_dollars_to_cents( params[:product][:price] )

    respond_to do |format|
      if @fabric.save
        format.html { redirect_to @fabric, notice: 'Fabric was successfully created.' }
        format.json { render json: @fabric, status: :created, location: @fabric }
      else
        format.html { render action: "new" }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@fabric = Fabric.find(params[:id])
    @fabric.updater = current_user

    respond_to do |format|
      if @fabric.update_attributes(params[:fabric])
        format.html { redirect_to @fabric, notice: 'Fabric was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@fabric = Fabric.find(params[:id])
    @fabric.destroy

    respond_to do |format|
      format.html { redirect_to fabrics_url }
      format.json { head :no_content }
    end
  end
end

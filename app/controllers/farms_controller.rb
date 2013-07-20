class FarmsController < ApplicationController
  layout "farm"
  load_and_authorize_resource
  include Trackable
  
  def index
    #@farms = Farm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @farms }
    end
  end

  def show
    #@farm = Farm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @farm }
    end
  end

  def new
    #@farm = Farm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @farm }
    end
  end

  def edit
    #@farm = Farm.find(params[:id])
  end

  def create
    set_creator_and_updater @farm, current_user    
    respond_to do |format|
      if @farm.save
        format.html { redirect_to @farm, notice: 'Farm was successfully created.' }
        format.json { render json: @farm, status: :created, location: @farm }
      else
        format.html { render action: "new" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@farm = Farm.find(params[:id])
    @farm.updater = current_user

    respond_to do |format|
      if @farm.update_attributes(params[:farm])
        format.html { redirect_to @farm, notice: 'Farm was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @farm.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@farm = Farm.find(params[:id])
    @farm.destroy

    respond_to do |format|
      format.html { redirect_to farms_url }
      format.json { head :no_content }
    end
  end
end

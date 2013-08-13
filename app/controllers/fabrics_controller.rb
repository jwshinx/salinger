class FabricsController < ApplicationController
  layout "fabric"
  load_and_authorize_resource
  include Trackable
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
    @fabric.prices.build
  end

  def create
    @fh = FabricHandler.new @fabric, current_user, params[:fabric][:prices_attributes]['0'][:amount], params[:fabric][:prices_attributes]['0'][:date]

    respond_to do |format|
      #if @fabric.save
      if @fh.save
        format.html { redirect_to @fabric, notice: 'Fabric was successfully created.' }
        format.json { render json: @fabric, status: :created, location: @fabric }
      else
        format.html { render action: "new" }
        format.json { render json: @fabric.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    0.upto(params[:fabric][:prices_attributes].length-1) do |i| 
     unless params[:fabric][:prices_attributes][i.to_s][:amount].blank? 
      params[:fabric][:prices_attributes][i.to_s][:created_by] = current_user.id
      params[:fabric][:prices_attributes][i.to_s][:updated_by] = current_user.id
      dollared_price = convert_dollars_to_cents( params[:fabric][:prices_attributes][i.to_s][:amount] ) 
      params[:fabric][:prices_attributes][i.to_s][:amount] = dollared_price
      params[:fabric][:prices_attributes][i.to_s][:date] = Date.strptime(params[:fabric][:prices_attributes][i.to_s][:date], '%m/%d/%Y') 
     end
    end
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

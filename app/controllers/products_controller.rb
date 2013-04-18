class ProductsController < ApplicationController
  layout "product"
  load_and_authorize_resource

  def new_payment
   render 'shared/payment/new_payment.html.haml'
  end
  def process_payment
   redirect_to products_url, notice: 'Payment was successful.' 
  end
  def index
    #@products = Product.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  def show
    #@product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  def new
    #@product = Product.new
    3.times { @product.sewings.build }

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    #@product = Product.find(params[:id])
    (3-@product.sewings.length).times { @product.sewings.build }
    
  end

  def create
    #@product = Product.new(params[:product])
    @product.creator = current_user
    @product.updater = current_user
    @product.sewings.each { |s| s.creator = current_user }
    @product.sewings.each { |s| s.updater = current_user }
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    #@product = Product.find(params[:id])
    @product.updater = current_user
    @product.sewings.each { |s| s.updater = current_user }

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end

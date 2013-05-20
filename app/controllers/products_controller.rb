require 'formatable'

class ProductsController < ApplicationController
  layout "product"
  load_and_authorize_resource
  include Formatable

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
    @product.todos.build 
    @product.fyis.build 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  def edit
    #@product = Product.find(params[:id])
    #3.times { @product.sewings.build }
    (3-@product.sewings.length).times { @product.sewings.build }
    
  end

  def create
    #@product = Product.new(params[:product])
    @product.creator = current_user
    @product.updater = current_user
    @product.sewings.each { |s| s.creator = current_user }
    @product.sewings.each { |s| s.updater = current_user }
    @product.fyis.each { |f| f.creator = current_user }
    @product.fyis.each { |f| f.updater = current_user }
    @product.todos.each { |t| t.creator = current_user }
    @product.todos.each { |t| t.updater = current_user }

    @product.price = convert_dollars_to_cents( params[:product][:price] ) 

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
    logger.debug "---> PC.update 0: #{params.inspect}" 
    @product.updater = current_user
    logger.debug "---> PC.update 1: #{@product.sewings.length}" 
    0.upto(2) do |i|
     logger.debug "---> PC.update 1.1: #{i}"
     @product.sewings_attributes = [ params[:product][:sewings_attributes][i.to_s] ]
     #x.updater = current_user 
     #x.creator = current_user 
    end
    logger.debug "---> PC.update 2" 
    logger.debug "---> PC.update 2.1: #{params[:product][:sewings_attributes]['0'].inspect}"
    logger.debug "---> PC.update 2.2: #{params[:product][:sewings_attributes]['1'].inspect}"
    logger.debug "---> PC.update 2.3: #{params[:product][:sewings_attributes]['2'].inspect}"
    logger.debug "---> PC.update 2.4" 
    logger.debug "---> PC.update 2.5: #{@product.sewings.inspect}" 
    @product.sewings.each do |s| 
     logger.debug "---> PC.update 3.1: #{s.inspect}" 
     if s.creator.nil? 
      logger.debug "---> PC.update 3.2"
      s.creator = current_user 
     else
      logger.debug "---> PC.update 3.3" 
     end
     s.updater = current_user 
    end
    @product.save
    #@product.sewings.each { |s| s.updater = current_user }
    #if params[:product][:sewings_attributes]['0'][:id].nil? && !params[:product][:sewings_attributes]['0'][:fabric_id].nil? 
    logger.debug "---> PC.update 4.81: #{@product.sewings.inspect}" 
    params[:product].delete :sewings_attributes
    logger.debug "---> PC.update 4.82: #{@product.sewings.inspect}" 

    logger.debug "---> PC.update 4.9" 
    @product.fyis.each { |f| f.creator = current_user if f.new_record? }
    @product.fyis.each { |f| f.updater = current_user }
    logger.debug "---> PC.update 5" 
    @product.todos.each { |t| t.creator = current_user if t.new_record?}
    @product.todos.each { |t| t.updater = current_user }
    logger.debug "---> PC.update 5.1: params: #{params.inspect}" 

    params[:product][:price] = convert_dollars_to_cents( params[:product][:price] ) 
    respond_to do |format|
      if @product.update_attributes(params[:product])
        logger.debug "---> PC.update 10: #{params.inspect}"
        logger.debug "---> PC.update 10.1: #{@product.inspect}"
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

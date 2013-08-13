class ProductBuilder
  include Formatable
  include Trackable
  
  attr_reader :product, :user, :price
  
  def initialize options, user
    @product = Product.new options
    @user = user
    @product.price = convert_dollars_to_cents( options[:price] )
    @price = options[:price] 
    fill_in_creator_and_updater
  end  
  
  def fill_in_creator_and_updater
    set_creator_and_updater @product, @user
    @product.sewings.each { |s| set_creator_and_updater s, @user }
    @product.fyis.each { |f| set_creator_and_updater f, @user }
    @product.todos.each { |t| set_creator_and_updater t, @user }
  end 
  
  def save
    @product.save
  end
end
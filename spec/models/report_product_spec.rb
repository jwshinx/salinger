require "spec_helper"
require 'cancan/matchers'
require 'report_queries'

describe Product do
  describe "report information" do
    describe "counting fabrics" do
      describe "Jimmyz scarf" do
        before do
          role = Role.create({name: 'admin', description: 'blah'})
          @user = User.create({
            active: true, username: 'joel', role_id: role.id,
            email: "admin@example.com", password: "password",
            password_confirmation: 'password'
          })
          @fabric = Fabric.create({name: 'Black', updated_by: @user.id, created_by: @user.id})
          @redfabric = Fabric.create({name: 'Red', updated_by: @user.id, created_by: @user.id})
          @product = Product.new({
            name: 'Jimmyz', description: 'blah', 
            price: 5000, count: 10, created_by: @user.id, updated_by: @user.id
          })
          @product.sewings.new({fabric_id:@fabric.id, updated_by: @user.id, created_by: @user.id})
          @product.sewings.new({fabric_id:@redfabric.id, updated_by: @user.id, created_by: @user.id})
          @product.save
        end
        it "returns fabric count 2" do
          class << Object 
            include ReportQueries
          end
          result = Object.get_product_count_of_unique_fabrics
          result[0].fabric_count.should == 2
        end
        it "returns product name 'packers home'" do
          class Object; extend ReportQueries; end
          result = Object.get_product_count_of_unique_fabrics
          result.length.should == 1
          result[0].product_name.should == 'Jimmyz' 
        end
      end
    end
  end
end

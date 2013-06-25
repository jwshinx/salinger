require "spec_helper"
require 'cancan/matchers'
require 'report_queries'

describe Product do
  describe "report information" do
    describe "counting fabrics" do
      describe "Packers scarf" do
        before { FactoryGirl.create(:packers_home) }
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
          result[0].product_name.should == 'packers home' 
        end
      end
    end
  end
end

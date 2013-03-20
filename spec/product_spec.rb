require "spec_helper"

describe Product do

 describe "when perfect" do
  subject { Product.new( {name: 'red polkadots', description: 'two inch diameter dots throughout', price: 35.50} ) }
  specify { subject.should be_valid } 
  its(:name) { should_not be_blank }
  its(:description) { should_not be_blank }
  its(:price) { should_not be_blank }
 end
end

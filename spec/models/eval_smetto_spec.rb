require "spec_helper"
require 'cancan/matchers'

describe EvalSmetto do
 describe "Eval of" do
  describe "Customer" do
   it "returns true" do
    EvalSmetto.new('Customer').is_evalable?.should be_true
   end
  end
  describe "Product" do
   it "returns true" do
    EvalSmetto.new('Product').is_evalable?.should be_true
   end
  end
  describe "Fabric" do
   it "returns false" do
    EvalSmetto.new('Fabric').is_evalable?.should be_false
   end
  end
  describe "nil" do
   it "returns false" do
    EvalSmetto.new(nil).is_evalable?.should be_false
   end
  end
  describe " x " do
   it "returns false" do
    EvalSmetto.new(' x ').is_evalable?.should be_false
   end
  end
  describe "blanks" do
   it "returns false" do
    EvalSmetto.new('').is_evalable?.should be_false
   end
  end
 end
end

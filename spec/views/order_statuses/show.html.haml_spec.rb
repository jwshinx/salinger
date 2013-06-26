require 'spec_helper'

describe "order_statuses/show" do
  before(:each) do
    @order_status = assign(:order_status, stub_model(OrderStatus,
      :title => "Title",
      :description => "MyText",
      :updated_by => 1,
      :created_by => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end

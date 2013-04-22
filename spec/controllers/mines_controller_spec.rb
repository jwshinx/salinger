require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe MinesController do

  # This should return the minimal set of attributes required to create a valid
  # Mine. As you add validations to Mine, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # MinesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all mines as @mines" do
      mine = Mine.create! valid_attributes
      get :index, {}, valid_session
      assigns(:mines).should eq([mine])
    end
  end

  describe "GET show" do
    it "assigns the requested mine as @mine" do
      mine = Mine.create! valid_attributes
      get :show, {:id => mine.to_param}, valid_session
      assigns(:mine).should eq(mine)
    end
  end

  describe "GET new" do
    it "assigns a new mine as @mine" do
      get :new, {}, valid_session
      assigns(:mine).should be_a_new(Mine)
    end
  end

  describe "GET edit" do
    it "assigns the requested mine as @mine" do
      mine = Mine.create! valid_attributes
      get :edit, {:id => mine.to_param}, valid_session
      assigns(:mine).should eq(mine)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Mine" do
        expect {
          post :create, {:mine => valid_attributes}, valid_session
        }.to change(Mine, :count).by(1)
      end

      it "assigns a newly created mine as @mine" do
        post :create, {:mine => valid_attributes}, valid_session
        assigns(:mine).should be_a(Mine)
        assigns(:mine).should be_persisted
      end

      it "redirects to the created mine" do
        post :create, {:mine => valid_attributes}, valid_session
        response.should redirect_to(Mine.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved mine as @mine" do
        # Trigger the behavior that occurs when invalid params are submitted
        Mine.any_instance.stub(:save).and_return(false)
        post :create, {:mine => { "name" => "invalid value" }}, valid_session
        assigns(:mine).should be_a_new(Mine)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Mine.any_instance.stub(:save).and_return(false)
        post :create, {:mine => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested mine" do
        mine = Mine.create! valid_attributes
        # Assuming there are no other mines in the database, this
        # specifies that the Mine created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Mine.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => mine.to_param, :mine => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested mine as @mine" do
        mine = Mine.create! valid_attributes
        put :update, {:id => mine.to_param, :mine => valid_attributes}, valid_session
        assigns(:mine).should eq(mine)
      end

      it "redirects to the mine" do
        mine = Mine.create! valid_attributes
        put :update, {:id => mine.to_param, :mine => valid_attributes}, valid_session
        response.should redirect_to(mine)
      end
    end

    describe "with invalid params" do
      it "assigns the mine as @mine" do
        mine = Mine.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Mine.any_instance.stub(:save).and_return(false)
        put :update, {:id => mine.to_param, :mine => { "name" => "invalid value" }}, valid_session
        assigns(:mine).should eq(mine)
      end

      it "re-renders the 'edit' template" do
        mine = Mine.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Mine.any_instance.stub(:save).and_return(false)
        put :update, {:id => mine.to_param, :mine => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested mine" do
      mine = Mine.create! valid_attributes
      expect {
        delete :destroy, {:id => mine.to_param}, valid_session
      }.to change(Mine, :count).by(-1)
    end

    it "redirects to the mines list" do
      mine = Mine.create! valid_attributes
      delete :destroy, {:id => mine.to_param}, valid_session
      response.should redirect_to(mines_url)
    end
  end

end

require 'spec_helper'

describe SessionsController do
  before do
    @user = User.create({ :username => 'test', :password => 'test' })
  end

  describe "GET 'new'" do
    describe "with valid params" do
      it "redirects to the root path" do
        post :create, :username => 'test', :password => 'test'
        response.should redirect_to(root_path)
      end
    end

    describe "with invalid params" do
      it "re-renders the 'new' template" do
        post :create, :username => 'test', :password => 'invalid_password'
        response.should render_template("new")
      end
    end
  end

end

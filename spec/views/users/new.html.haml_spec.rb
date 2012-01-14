require 'spec_helper'

describe "users/new.html.haml" do
  before(:each) do
    assign(:user, stub_model(User,
      :username => "MyString",
      :salt => "MyString",
      :password => "MyString",
      :is_active => false,
      :is_super_admin => false
    ).as_new_record)
  end

  it "renders new user form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => users_path, :method => "post" do
      assert_select "input#user_username", :name => "user[username]"
      assert_select "input#user_salt", :name => "user[salt]"
      assert_select "input#user_password", :name => "user[password]"
      assert_select "input#user_is_active", :name => "user[is_active]"
      assert_select "input#user_is_super_admin", :name => "user[is_super_admin]"
    end
  end
end

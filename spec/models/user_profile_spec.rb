require 'spec_helper'

describe UserProfile do
  before do
    user = User.create({ :username => 'test', :salt => '', :password => 'test' })
    @valid_attributes = { user_id: user.id, surname: "Doe", given_names: "John",
                          gender: 0, phone: "444-444", mail: "admin@st.com" }
  end

  it "returns proper fullname" do
    profile = UserProfile.create! @valid_attributes
    profile.full_name(false).should == "John Doe"
    profile.full_name(true).should == "Doe, John"
  end
end

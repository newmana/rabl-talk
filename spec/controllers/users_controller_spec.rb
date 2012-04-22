require 'spec_helper'

describe UsersController do
  fixtures :users

  it "Get a list of users in JSON" do
    get :index
    response.should be_success
    actual_response = response.body
    response = JSON.parse(actual_response)
    response.size.should == 2
    seamus = {"full_name" => "Seamus Magoon Archer", "years_old" => 0,  "can_drink" => false, "id" => 1}
    archer = {"full_name" => "Sterling Archer", "years_old" => 35, "can_drink" => true, "id" => 2}
    response.first["user"].should include seamus
    response.second["user"].should include archer
  end

  it "Get Archer in XML" do
    request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, params = {:id => 2}
    puts response.body
  end
end
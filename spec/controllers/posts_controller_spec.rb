require 'spec_helper'

describe PostsController do
  fixtures :users, :posts

  it "Get post 1 in XML" do
    request.env["HTTP_ACCEPT"] = "application/xml"
    get :index, params = {:id => 1}
    puts response.body
  end
end
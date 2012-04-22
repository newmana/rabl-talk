require 'spec_helper'

describe "Sinatra App" do
  describe "should respond to POST" do
    it "no results" do
      post '/properties'
      last_response.should be_ok
      last_response.body.should eql("[]")
    end

    it "query a known parcel id" do
      post '/properties', params = { :parcel_ids => "131/RP747634" }
      last_response.should be_ok
      response = JSON.parse(last_response.body)
      response["parcel_ids"].should eql("131/RP747634")
      response["geom"].should match /^MULTIPOLYGON\(\(\(.*/
    end

    it "query a large number of parcel ids" do
      parcel_ids = (1..999).map { |lot_no| "#{lot_no}/RP747634" }.join(",")
      post '/properties', params = { :parcel_ids => parcel_ids }
      last_response.should be_ok
      response = JSON.parse(last_response.body)
      response["parcel_ids"].should eql(parcel_ids)
      response["geom"].should match /^MULTIPOLYGON\(\(\(.*/
    end
  end
end
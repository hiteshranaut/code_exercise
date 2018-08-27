 # require "spec_helper"   
# require "rspec"


RSpec.describe  Api::V1::CarsController , type: :controller do

 # require 'jwt'

# pending "add some examples to (or delete) #{__FILE__}"


describe 'GET /v1/feeds/' , :type => :request do


it "should show return 401" do
  #create 10 reviews
 
  get '/api/v1/cars/random',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'  } 
   json = JSON.parse(response.body)
   expect(response.status).to eq 401
  end



it "should return 200" do
   FactoryGirl.create(:car) 
   get '/api/v1/cars/subaru_impreza',  xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'  } 
   json = JSON.parse(response.body)
   expect(json["data"]["car"]["max_speed_on_track"]).to eq "no track selected"
   # $stderr.puts json["data"]["car"]["max_speed_on_track"]
   expect(response.status).to eq 200
end


it "should return track not found" do

   FactoryGirl.create(:car) 
   get '/api/v1/cars/subaru_impreza', {:track => 'Nurburgring'} , xhr: true,  headers: { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json'  } 
   json = JSON.parse(response.body)
   expect(json["data"]["car"]["max_speed_on_track"]).to eq "track not found"
   # $stderr.puts json["data"]["car"]["max_speed_on_track"]
   # expect(response.status).to eq 200

end
  


end



end
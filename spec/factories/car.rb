
if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do


  factory :car do
        id 1
        car_slug "subaru_impreza"
        max_speed "280"
  end
  

end

end

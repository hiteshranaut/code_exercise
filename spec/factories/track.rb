
if Rails.env.test?
	require 'factory_girl'

FactoryGirl.define do


  factory :track do
        id 1
        name "nurburgring"
        surface_type "snow"
        time_zone "CET"
  end
  

end

end

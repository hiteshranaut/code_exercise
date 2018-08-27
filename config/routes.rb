Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".


namespace :api, :defaults => {:format => :json} do
  namespace :v1 do 
      get "/cars/:car_slug" => "cars#show"
      get "/cars/" => "cars#showc"
    end 
end 


end

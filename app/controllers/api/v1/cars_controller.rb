	class Api::V1::CarsController < ApplicationController
	     
	     before_action :set_car

	   
		def show
		    	max_speed_on_track = Track.max_speed_on_track(@car.max_speed , params[:track])
				render :json => { :data => { :car => {
					              	             	id: @car.id ,
													car_slug: @car.car_slug , 
													max_speed: "#{@car.max_speed}km/h", 
													max_speed_on_track: max_speed_on_track
					              	                }  } }, status: 200
		 end


		def set_car
			@car = Car.find_by_car_slug(params["car_slug"])
			render json: { errors: [ { detail: "Access denied" } ] }, status: 401  if @car.nil? 
		end


	end
	# == Schema Information
	#
	# Table name: tracks
	#
	#  id           :integer          not null, primary key
	#  name         :string           not null
	#  surface_type :string           not null
	#  time_zone    :string           not null
	#  created_at   :datetime         not null
	#  updated_at   :datetime         not null
	#

	class Track < ActiveRecord::Base
		SURFACE_TYPE = ['snow', 'gravel' , 'asphalt']
		validates_inclusion_of :surface_type, :in => SURFACE_TYPE , :message => "only 'snow', 'gravel' , 'asphalt' values are allowed."

		validates_presence_of :name, :surface_type
	    validates_uniqueness_of :name

	  #max_speed_on_track function 
	  #function will will return max spped on track based on provided input
	   def self.max_speed_on_track(max_speed , track)

	          if track.nil?
	          	return "no track selected"
	          end

	           track = self.where('lower(name) = ?', track.downcase).first

	   	       surface_slowing_factor = self.surface_slowing_factor(track)
	          #if surface_slowing_factor is string return error
	   	       if surface_slowing_factor.class == String
	   	       	return surface_slowing_factor
	   	       end

		       slowing_time_factor = self.slowing_time_factor(track)

		    max = max_speed - ( (slowing_time_factor.to_f + surface_slowing_factor.to_f)/100 * max_speed )
		    return "#{max}km/h"

		  end




	#Function self.slowing_time_factor(track)
	#@params track
	#return Integer
	#function will return slowing_time_factor of track based on it's time zone.
		def self.slowing_time_factor(track)
		
		    #current time in track time zone
			current_time_in_zone = Time.now.in_time_zone(track.time_zone)

			#converting to HH:MM
	        current_time = current_time_in_zone.strftime("%H:%M")

		    # 9am – 6pm    | 0% 
			# 6pm – 9.30pm | 8% 
			# 9.30pm – 6am | 15% 
			# 6am – 9am    | 8% 
		    if ( (current_time >= "09:00".to_time.strftime("%H:%M") && current_time <= "12:00".to_time.strftime("%H:%M") ) ||  (current_time >= "12:00".to_time.strftime("%H:%M") && current_time < "18:00".to_time.strftime("%H:%M") ) )
				return 0
			elsif current_time >= "18:00".to_time.strftime("%H:%M") && current_time < "21:30".to_time.strftime("%H:%M")
				return 8
			elsif ( (current_time >= "21:30".to_time.strftime("%H:%M") && current_time <= "00:00".to_time.strftime("%H:%M") && current_time >= "00:00".to_time.strftime("%H:%M") ) || ( current_time < "06:00".to_time.strftime("%H:%M")) )
				return 15
			elsif current_time > "06:00".to_time.strftime("%H:%M") && current_time <= "09:00".to_time.strftime("%H:%M")
				return 9
			end
			
		end

	   

	   #function self.surface_slowing_factor(track)
	   #params track(Object)
	   #function will return random no between 0 - 35 if each surface_type
	   #function will return String if track is nil
		  def self.surface_slowing_factor(track)
			    if !track.nil?
	              surface_type = track.surface_type
			      case surface_type
			      when 'snow'
			        return rand(0..35)
			      when 'gravel'
			        return rand(0..35)
			      when 'asphalt'
			        return rand(0..35)
			      else
			        return "surface_type not found"
			      end
			    else
			      return "track not found"
			    end
			  end





	end

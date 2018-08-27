# == Schema Information
#
# Table name: cars
#
#  id         :integer          not null, primary key
#  car_slug   :string           not null
#  max_speed  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Car < ActiveRecord::Base
		validates_presence_of :car_slug, :max_speed
	    validates_uniqueness_of :car_slug
end

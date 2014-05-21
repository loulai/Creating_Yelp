class Review < ActiveRecord::Base
	belongs_to :restaurant
	validates :thoughts, length: {minimum: 2}
end

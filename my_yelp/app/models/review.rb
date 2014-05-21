class Review < ActiveRecord::Base
	belongs_to :restaurant
	validates :thoughts, length: {minimum: 2, message: " are too short (min. 2 characters)."}
	validates :rating, presence: true, inclusion: {in: [*1..5], message: " must be between 1 and 5. Don't mess with me, punk."}                      
end

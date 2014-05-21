module ReviewsHelper
	def star_rating(rating_number)
		filled_stars = '☆' * rating_number
		empty_star = '☆' * (5-rating_number)
	end     
end

module ReviewsHelper
	def star_rating(rating_number)
		if rating_number.respond_to? :round
			rounded_rating = rating_number.round
			filled_stars = '★' * rounded_rating
			blank_stars = '☆' * (5 - rounded_rating)
			result = filled_stars + blank_stars
		else
			'N/A'
		end
	end     
end

module ReviewsHelper
	def star_rating(value)
		return value unless value.respond_to? :round
			rounded_rating = rating_number.round
			filled_stars = '★' * rounded_rating
			blank_stars = '☆' * (5 - rounded_rating)
			result = filled_stars + blank_stars
	end     
end

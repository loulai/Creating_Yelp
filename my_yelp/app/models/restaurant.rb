class Restaurant < ActiveRecord::Base
	validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'Name must start with a capital letter'}
	validates :address, presence: true, length: {minimum: 3}
	validates :cuisine, presence: true
	has_many :reviews

	def average_rating
		if reviews.any?
			total_rating_sum = reviews.inject(0) {|accum, review| accum + review.rating}
			total_rating_sum / reviews.count
		else
			"N/A"
		end
	end


end


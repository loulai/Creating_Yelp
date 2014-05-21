class Restaurant < ActiveRecord::Base
	validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'Name must start with a capital letter'}
	validates :address, presence: true, length: {minimum: 3}
	validates :cuisine, presence: true
	has_many :reviews

	def average_rating
		if reviews.any?
			total_review_sum = reviews.to_a.inject {|accum, rating| accum + rating.review}
			tota_review_sum / reviews.count
		else
			"N/A"
		end
	end


end


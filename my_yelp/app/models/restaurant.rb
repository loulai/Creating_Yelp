class Restaurant < ActiveRecord::Base
	validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'Name must start with a capital letter'}
	validates :address, presence: true, length: {minimum: 3}
	validates :cuisine, presence: true
	has_many :reviews

	def average_rating
		"N/A"
	end


end


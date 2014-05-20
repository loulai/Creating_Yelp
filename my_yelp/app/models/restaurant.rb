class Restaurant < ActiveRecord::Base
	validates :name, presence: true, format: {with: /\A[A-Z]/, message: 'Name must start with a capital letter'}
	validates :address, presence: true, length: {minimum: 3}
	validates :cuisine, presence: true
end

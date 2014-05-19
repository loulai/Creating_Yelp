class RestaurantsController < ApplicationController

	def index
	end

	def new
	end

	def create
		Restaurant.create({name: 'Pret', address: '5 City Road, London'})
	end

end

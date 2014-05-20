class RestaurantsController < ApplicationController

	def index
		@restaurants = Restaurant.all
	end

	def new
		@restaurant = Restaurant.new
	end

	def create
		raise 'hello'
		Restaurant.create({name: 'Pod', address: '1 City Road, London'})
		redirect_to '/restaurants'
	end

end

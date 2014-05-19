class RestaurantsController < ApplicationController

	def index
	end

	def new
	end

	def create
		Restaurant.create({name: 'Pod', address: '1 City Road, London'})
		redirect_to '/restaurants'
	end

end

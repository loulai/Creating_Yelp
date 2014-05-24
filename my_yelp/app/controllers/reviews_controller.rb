class ReviewsController < ApplicationController

  def new
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	@review = Review.new
  end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	
  	@review = @restaurant.reviews.create!(params[:review].permit(:thoughts, :rating))

    render 'create', content_type: :json
    # render json: review.to_json(except: [:id, :created_at, :updated_at], include: :restaurant)

  	# if @review.save(params[:review].permit(:thoughts, :rating))
  	# 	flash[:notice] = "Thank you for reviewing #{@restaurant.name}!"
  	# 	redirect_to '/restaurants'
  	# else
  	# 	render 'new'
  	# end
  end
end

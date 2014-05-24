class ReviewsController < ApplicationController

  # def new
  # 	@restaurant = Restaurant.find(params[:restaurant_id])
  # 	@review = Review.new
  # end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	
  	@review = @restaurant.reviews.new(params[:review].permit(:thoughts, :rating))

    render json: review

  	# if @review.save(params[:review].permit(:thoughts, :rating))
  	# 	flash[:notice] = "Thank you for reviewing #{@restaurant.name}!"
  	# 	redirect_to '/restaurants'
  	# else
  	# 	render 'new'
  	# end
  end
end

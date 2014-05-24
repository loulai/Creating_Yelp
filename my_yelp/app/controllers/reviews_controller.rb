class ReviewsController < ApplicationController

  # def new
  # 	@restaurant = Restaurant.find(params[:restaurant_id])
  # 	@review = Review.new
  # end

  def create
  	@restaurant = Restaurant.find(params[:restaurant_id])
  	
  	@review = @restaurant.reviews.new(params[:review].permit(:thoughts, :rating))

    respond_to do |format|
      format.html { redirect_to '/restaurants'}
      format.json { render json: review }
    end

  	# if @review.save(params[:review].permit(:thoughts, :rating))
  	# 	flash[:notice] = "Thank you for reviewing #{@restaurant.name}!"
  	# 	redirect_to '/restaurants'
  	# else
  	# 	render 'new'
  	# end
  end
end

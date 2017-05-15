
class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find params[:product_id]
    rev = params[:review]
    @review = @product.reviews.new(
      user: current_user,
      description: rev[:description],
      rating: rev[:rating]
    )
    if @review.save
      redirect_to product_path @product
  else
      render product_path 
    end
  end

  def destroy
    @reviewed = Review.find params[:id]
    @product = @reviewed.product
    @reviewed.destroy
    redirect_to product_path @product
  end
end
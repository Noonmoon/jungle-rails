class ReviewsController < ApplicationController
  before_filter :authorize

  def create
    puts review_params
    @user ||= User.find(session[:user_id]) if session[:user_id]
    @product = Product.find params[:product_id]
    @review_hash = {
      :product_id => params[:product_id],
      :user_id => session[:user_id],
      :description => review_params[:description],
      :rating => review_params[:rating]
    }
    @review = Review.new(@review_hash)
    if @review.save
      redirect_to "/products/#{params[:product_id]}", notice: 'Review created!'
    else
      render @product
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.reviews.find(params[:id])
    @review.destroy

    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(
      :description,
      :rating
    )
  end
end

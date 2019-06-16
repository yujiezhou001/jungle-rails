class ReviewsController < ApplicationController

    before_filter :authorize

    def create
        #find the parent element
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user
        if (@review.save!)
            redirect_to @product
        else
            redirect_to product_path
        end
    end

    def destroy
        @review = Review.find(params[:id])
        @review.destroy
        @product = Product.find(params[:product_id])
        flash[:success] = "Review deleted"
        redirect_to @product
    end

    private

    def review_params
        params.require(:review).permit(:description, :rating)
    end
    
end

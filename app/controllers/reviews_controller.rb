class ReviewsController < ApplicationController
    def review_params
        params.require(:review).permit(:description, :rating)
    end
    def create
        #find the parent element
        @product = Product.find(params[:product_id])
        @review = @product.reviews.create(review_params)
        @review.user = current_user
        if (@review.save!)
            redirect_to products_path
        else
            redirect_to product_path
        end
    end
end

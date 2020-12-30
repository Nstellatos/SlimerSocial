class ReviewsController < ApplicationController
    before_action :find_recipe

    def new 
        @review = Review.new 
    end

    def create 
        @review = Review.new(review_params)
        @review.recipe_id = @recipe.id 
        @review.user_id = current_user.id 
        if @review.save 
            redirect_to recipe_path(@recipe)
        else
            render 'new'
        end
    end

    private 

    def review_params 
        params.require(:review).permit(:rating, :comment)
    end

    def find_recipe 
        @recipe = Recipe.find(params[:recipe_id])
    end

end

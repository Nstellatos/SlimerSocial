class RecipesController < ApplicationController
    before_action :find_recipe, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, only: [:new, :edit]
    def index 
        @recipes = Recipe.all.order("created_at DESC")
    end

    def show 
        if @recipe.reviews.blank?
			@average_review = 0
		else
			@average_review = @recipe.reviews.average(:rating).round(2)
		end
	end
    def new 
        @recipe = current_user.recipes.build
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save 
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit 
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end

    def destroy
        @recipe.destroy 
        redirect_to root_path
    end



    private

    def recipe_params 
        params.require(:recipe).permit(:title, :description, :recipe_img, ingredients_attributes:[:id, :content, :_destroy], steps_attributes:[:id, :direction, :_destroy])
    end

    def find_recipe 
        @recipe = Recipe.find(params[:id]) 
    end


end

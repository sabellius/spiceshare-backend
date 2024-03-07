class Api::V1::RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: recipes
  end

  def create
    recipe = Recipe.create!(recipe_params)
    render json: recipe, status: :created
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update!(recipe_params)
    render json: recipe, status: :ok
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe, status: :ok
  end

  def destroy
    Recipe.find(params[:id]).destroy
    render json: {}, status: :no_content
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :title, :description, :prep_time, :cook_time, :servings, ingredients_attributes: [:id, :name, :amount, :unit, :optional], instructions_attributes: [:id, :step_number, :description])
  end
end

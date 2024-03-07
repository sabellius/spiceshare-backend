class Api::V1::RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    render json: RecipeSerializer.new(recipes).serializable_hash.to_json
  end

  def create
    recipe = Recipe.create!(recipe_params.merge!(user: current_user))
    render json: RecipeSerializer.new(recipe).serializable_hash.to_json, status: :created
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update!(recipe_params)
    render json: RecipeSerializer.new(recipe).serializable_hash.to_json, status: :ok
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: RecipeSerializer.new(recipe).serializable_hash.to_json, status: :ok
  end

  def destroy
    Recipe.find(params[:id]).destroy
    render json: {}, status: :no_content
  end

  private

  def recipe_params
    params.require(:recipe).permit(:id, :title, :description, :prep_time, :cook_time, :servings,
                                   ingredients_attributes: %i[id name amount unit optional, _destroy], instructions_attributes: %i[id step_number description _destroy])
  end
end

require 'rails_helper'

RSpec.describe "Api::V1::RecipesController", type: :request do
  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      recipe = Recipe.create(title: 'Test Recipe', instructions: 'Test instructions')
      get :show, params: { id: recipe.id }
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    it 'creates a new recipe' do
      recipe_params = { title: 'New Recipe', instructions: 'New instructions' }
      post :create, params: { recipe: recipe_params }
      expect(response).to have_http_status(:created)
    end
  end

  describe 'PUT #update' do
    it 'finds the recipe by the given id and updates it' do
      recipe = Recipe.create(title: 'Test Recipe', instructions: 'Test instructions')
      recipe_params = { title: 'Updated Recipe', instructions: 'Updated instructions' }
      put :update, params: { id: recipe.id, recipe: recipe_params }
      expect(response).to have_http_status(:success)
      expect(recipe.reload.title).to eq('Updated Recipe')
      expect(recipe.reload.instructions).to eq('Updated instructions')
      expect(response.content_type).to eq('application/json')
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create(title: 'Test Recipe', instructions: 'Test instructions')
      delete :destroy, params: { id: recipe.id }
      expect(response).to have_http_status(:no_content)
    end
  end
end

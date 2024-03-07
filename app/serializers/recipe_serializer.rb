class RecipeSerializer
  include JSONAPI::Serializer

  attributes :title, :description, :prep_time, :cook_time, :servings
  has_many :ingredients
  has_many :instructions
end

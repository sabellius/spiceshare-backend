class IngredientSerializer
  include JSONAPI::Serializer

  attributes :id, :name, :amount, :unit, :optional
end

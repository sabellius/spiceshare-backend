class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :delete_all
  has_many :instructions, dependent: :delete_all

  accepts_nested_attributes_for :ingredients, :instructions, allow_destroy: true
end

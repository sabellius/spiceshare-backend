class Recipe < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :delete_all
  has_many :instructions, dependent: :delete_all

  accepts_nested_attributes_for :ingredients, :instructions, allow_destroy: true

  validates :title, presence: true
  validates :description, presence: true
  validates :prep_time, presence: true
  validates :cook_time, presence: true
  validates :servings, presence: true
end

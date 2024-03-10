class Instruction < ApplicationRecord
  belongs_to :recipe

  validates :step_number, presence: true
  validates :description, presence: true
end

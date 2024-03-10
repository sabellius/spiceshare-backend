require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  context 'validations' do
    it { should belong_to(:recipe) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:unit) }
    it { should validate_presence_of(:amount) }
  end
end

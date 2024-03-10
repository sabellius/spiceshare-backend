require 'rails_helper'

RSpec.describe Recipe, type: :model do

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:prep_time) }
  it { should validate_presence_of(:cook_time) }
  it { should validate_presence_of(:servings) }

  it { should belong_to(:user) }
  it { should have_many(:ingredients) }
  it { should have_many(:instructions) }
end

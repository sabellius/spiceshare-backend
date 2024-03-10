require 'rails_helper'

RSpec.describe Instruction, type: :model do

  context 'validations' do
    it { should belong_to(:recipe) }
    it { should validate_presence_of(:step_number) }
    it { should validate_presence_of(:description) }
  end
end

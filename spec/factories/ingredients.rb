FactoryBot.define do
  factory :ingredient do
    name { "MyString" }
    amount { 1 }
    unit { "MyString" }
    optional { false }
    recipe { nil }
  end
end

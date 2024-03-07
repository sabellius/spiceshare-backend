FactoryBot.define do
  factory :instruction do
    step_number { 1 }
    description { "MyText" }
    recipe { nil }
  end
end

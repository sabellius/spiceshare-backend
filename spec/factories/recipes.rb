FactoryBot.define do
  factory :recipe do
    name { 'French Onion Soup' }
    description { 'A delicious soup' }
    prep_time { 30 }
    cook_time { 30 }
    servings { 4 }
    user { nil }
  end
end

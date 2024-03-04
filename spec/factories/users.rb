FactoryBot.define do
  factory :user do
    first_name { 'Israel' }
    last_name { 'Israeli' }
    sequence(:email) { "user#{_1}@example.com" }
    sequence(:username) { "user#{_1}" }
    password_digest { 'Password1!' }
  end
end

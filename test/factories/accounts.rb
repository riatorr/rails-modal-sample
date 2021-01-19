FactoryBot.define do
  factory :account do
    name { Faker::Name.unique.name }
    login { name&.parameterize }
    email { "#{login}@example.com" }
    password { "password" }
    password_confirmation { password }
  end
end

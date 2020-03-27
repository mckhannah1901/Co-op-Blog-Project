FactoryBot.define do
    factory :user do
      first_name { "John" }
      second_name  { "Doe" }
      email { "factorybot@test.com" }
      password { "password" }
      password_confirmation { "password" }
      id { "22" }
    end
end

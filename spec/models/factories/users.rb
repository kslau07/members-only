# frozen_string_literal: true

# Implement with Faker next
FactoryBot.define do
  factory :user do
    email { 'test@example.com' }
    password { 'password1' }
  end
end

# FactoryBot.define do
#   factory :user do
#     email {'test@example.com'}
#     password { 'password1' }
#   end
# end

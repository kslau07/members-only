# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE 
#
FactoryBot.define do
  factory :user do
    email { 'user1@example.com' }
    password { 'password123' }

    factory :user_second do
      sequence(:email) { "user2@example.com" }
      sequence(:password) { "password123" }
    end

    factory :user_faker do
      sequence(:email) { "user_faker@example.com" }
      sequence(:password) { "password123" }
    end
  end
end


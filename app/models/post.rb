# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  body           :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_author_id :integer          not null
#
# Indexes
#
#  index_posts_on_post_author_id  (post_author_id)
#
# Foreign Keys
#
#  post_author_id  (post_author_id => users.id)
#
class Post < ApplicationRecord
  belongs_to :post_author, class_name: "User"
  # belongs_to :user
  has_many :likes, foreign_key: :liked_post_id
  has_many :liked_users, through: :likes, source: :liked_user

  validates :body, presence: true
end

# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  liked_post_id :integer
#  liked_user_id :integer
#
# Indexes
#
#  index_likes_on_liked_post_id  (liked_post_id)
#  index_likes_on_liked_user_id  (liked_user_id)
#
# Foreign Keys
#
#  liked_post_id  (liked_post_id => posts.id)
#  liked_user_id  (liked_user_id => users.id)
#
class Like < ApplicationRecord
  belongs_to :liked_user, class_name: "User"
  belongs_to :liked_post, class_name: "Post"

  validates :liked_post, uniqueness: { scope: :liked_user }
end

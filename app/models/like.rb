# == Schema Information
#
# Table name: likes
#
#  id            :integer          not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  liked_post_id :integer          not null
#  liked_user_id :integer          not null
#
# Indexes
#
#  index_likes_on_liked_post_id  (liked_post_id)
#  index_likes_on_liked_user_id  (liked_user_id)
#
# Foreign Keys
#
#  liked_post_id  (liked_post_id => post.id)
#  liked_user_id  (liked_user_id => user.id)
#
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
end

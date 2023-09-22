class AddUniquePostsUsersIndexOnLikes < ActiveRecord::Migration[7.0]
  def change
    # Each like belongs to a unique user and unique post
    add_index :likes, %i[post_id user_id], unique: true
  end
end

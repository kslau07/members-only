class AddUniquePostsUsersIndexOnLikes < ActiveRecord::Migration[7.0]
  def change
    add_index :likes, %i[liked_post_id liked_user_id], unique: true
  end
end

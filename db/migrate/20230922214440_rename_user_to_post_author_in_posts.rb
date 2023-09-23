class RenameUserToPostAuthorInPosts < ActiveRecord::Migration[7.0]
  def change
    rename_column :posts, :user_id, :post_author_id
  end
end

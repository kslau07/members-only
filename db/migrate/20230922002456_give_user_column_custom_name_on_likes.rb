class GiveUserColumnCustomNameOnLikes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :user, foreign_key: true
    add_reference :likes, :liked_user, foreign_key: { to_table: :users }
  end
end

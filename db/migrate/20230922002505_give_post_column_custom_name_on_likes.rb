class GivePostColumnCustomNameOnLikes < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :post, foreign_key: true
    add_reference :likes, :liked_post, foreign_key: { to_table: :posts}
  end
end

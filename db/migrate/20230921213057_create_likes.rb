class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      # add_reference :dogs, :good_owner, foreign_key: { to_table: :humans }, index: true
      # t.references :user, null: false, foreign_key: true
      # t.references :post, null: false, foreign_key: true
      t.references :liked_user, null: false, foreign_key: { to_table: :user }, index: true
      t.references :liked_post, null: false, foreign_key: { to_table: :post }, index: true

      t.timestamps
    end
  end
end

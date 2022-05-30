class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.string :title
      t.text :content
      t.string :image

      t.timestamps

      t.index %i[user_id post_id], unique: true
    end
  end
end

class CreateChoisePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :choise_posts do |t|
      t.references :post, null: false, foreign_key: true
      t.references :menu, null: false, foreign_key: true

      t.timestamps

      t.index %i[post_id menu_id], unique: true
    end
  end
end

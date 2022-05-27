class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true

      t.string :name
      t.text :details
      t.text :quickword
      t.text :catchcopy
      t.integer :member
      t.string :place
      t.string :category
      t.integer :price
      t.time :start_time
      t.time :finish_time
      t.date :release
      t.string :image

      t.timestamps
    end
  end
end

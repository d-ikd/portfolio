class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :details
      t.time :start_time
      t.time :finish_time
      t.integer :member
      t.float :place
      t.string :category
      t.string :image
      t.date :release
      t.integer :price

      t.timestamps
    end
  end
end

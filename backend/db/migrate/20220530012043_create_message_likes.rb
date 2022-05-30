class CreateMessageLikes < ActiveRecord::Migration[6.0]
  def change
    create_table :message_likes do |t|
      t.references :user, null: false, foreign_key: true
      t.references :message, null: false, foreign_key: true

      t.timestamps

      t.index %i[user_id message_id], unique: true
    end
  end
end

class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends, id: true, primary_key: [:from_friend_id, :to_friend_id] do |t|
      t.references :from_friend, foreign_key: { to_table: :users }, null: false
      t.references :to_friend, foreign_key: { to_table: :users }, null: false
      t.integer :status, null: false

      t.timestamps
    end
  end
end

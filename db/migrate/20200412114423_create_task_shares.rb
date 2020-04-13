class CreateTaskShares < ActiveRecord::Migration[5.2]
  def change
    create_table :task_shares do |t|
      t.references:task, null: false, foreign_key: true
      t.references :user1, null: false, foreign_key: { to_table: :users }
      t.references :user2, null: false, foreign_key: { to_table: :users }
      t.integer :group_id
      t.string :value1

      t.timestamps
    end
  end
end

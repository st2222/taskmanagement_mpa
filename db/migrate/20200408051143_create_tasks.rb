class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 30
      t.text :content, null: false, limit: 50
      t.integer :importance, null: false
      t.integer :urgency, null: false
#      t.references :user, foreign_key: true 
      t.string :image_id
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :value1
      t.string :value2

      t.timestamps
    end
  end
end

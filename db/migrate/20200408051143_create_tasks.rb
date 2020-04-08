class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.integer :importance
      t.integer :urgency
      t.string :image_id
      t.datetime :start_time
      t.datetime :end_time
      t.string :value1
      t.string :value2

      t.timestamps
    end
  end
end

class CreateTaskBranches < ActiveRecord::Migration[5.2]
  def change
    create_table :task_branches, id: true, primary_key: [:task_id, :branch_id] do |t|
      t.references :task, foreign_key: true, null: false
      t.integer :branch_id, null: false
      t.string :content, null: false, limit: 30

      t.timestamps
    end
  end
end

class AddUserColumnToTask < ActiveRecord::Migration[5.2]
  def up
    add_reference :tasks, :user, foreign_key: true
  end
end

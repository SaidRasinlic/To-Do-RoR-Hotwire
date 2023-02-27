class AddCompletedAtToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :completed_at, :string, limit: 200
  end
end

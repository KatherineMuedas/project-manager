class AddsUseridAndAssigntoTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer
    add_column :tasks, :assign_to, :integer
  end
end

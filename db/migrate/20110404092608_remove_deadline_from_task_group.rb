class RemoveDeadlineFromTaskGroup < ActiveRecord::Migration
  def self.up
    remove_column :task_groups, :deadline
  end

  def self.down
    add_column :task_groups, :deadline, :datetime
  end
end

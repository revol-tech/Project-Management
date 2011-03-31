class AddPersonIdToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :person_id, :integer
  end

  def self.down
    remove_column :projects, :person_id
  end
end

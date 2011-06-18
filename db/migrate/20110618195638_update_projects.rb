class UpdateProjects < ActiveRecord::Migration
  def self.up
    change_column :projects, :starts_at, :string, :length => 50
    change_column :projects, :ends_at, :string, :length => 50
  end

  def self.down
    change_column :projects, :ends_at, :timestamp
    change_column :projects, :starts_at, :timestamp
  end
end

class CreateUpdates < ActiveRecord::Migration
  def self.up
    create_table :updates do |t|
      t.integer :project_id
      t.string :value
      t.timestamp :created_at
    end
  end

  def self.down
    drop_table :updates
  end
end

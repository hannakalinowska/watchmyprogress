class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.integer :user_id
      t.string :name
      t.text :description
      t.timestamp :starts_at
      t.timestamp :ends_at

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end

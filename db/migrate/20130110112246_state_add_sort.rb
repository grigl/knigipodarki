class StateAddSort < ActiveRecord::Migration
  def self.up
    add_column :states, :sort, :integer    
  end

  def self.down
    remove_column :states, :sort
  end
end

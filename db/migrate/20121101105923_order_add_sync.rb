class OrderAddSync < ActiveRecord::Migration
  def self.up
    add_column :orders, :is_sync, :bool    
  end

  def self.down
    remove_column :orders, :is_sync       
  end
end

class AddOnhandadd2ToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :on_hand_add2, :integer    
  end

  def self.down
    remove_column :products, :on_hand_add2
  end
end

class AddOnHandAdd2 < ActiveRecord::Migration
  def self.up
    add_column :variants, :count_on_hand_add2, :integer    
  end

  def self.down
    remove_column :variants, :count_on_hand_add2
  end
end

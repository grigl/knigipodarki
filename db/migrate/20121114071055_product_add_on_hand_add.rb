class ProductAddOnHandAdd < ActiveRecord::Migration
  def self.up
    add_column :variants, :count_on_hand_add, :integer    
  end

  def self.down
    remove_column :variants, :count_on_hand_add
  end
end

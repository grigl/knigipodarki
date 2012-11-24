class AddIsSaleItemToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :is_sale_item, :boolean
  end

  def self.down
    remove_column :line_items, :is_sale_item
  end
end

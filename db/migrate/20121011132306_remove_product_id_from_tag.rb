class RemoveProductIdFromTag < ActiveRecord::Migration
  def self.up
    remove_column :tags, :product_id
  end

  def self.down
    add_column :tags, :product_id, :integer
  end
end

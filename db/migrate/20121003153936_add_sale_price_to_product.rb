class AddSalePriceToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :sale_price, :decimal, :precision => 8, :scale => 2
  end

  def self.down
    remove_column :products, :sale_price
  end
end

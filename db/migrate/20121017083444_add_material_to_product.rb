class AddMaterialToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :material, :string
  end

  def self.down
    remove_column :products, :material
  end
end

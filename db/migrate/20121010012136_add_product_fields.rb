class AddProductFields < ActiveRecord::Migration
  def self.up
    add_column :products, :supplier, :string
    add_column :products, :category_name, :string
    add_column :products, :subname, :string
  end

  def self.down
    remove_column :products, :supplier
    remove_column :products, :category_name
    remove_column :products, :subname    
  end
end

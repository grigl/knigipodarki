class AddAdditionalFieldsToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :product_type, :string
    add_column :products, :author, :string
    add_column :products, :publishing_year, :string
    add_column :products, :isbn, :string
    add_column :products, :annotation, :string
  end

  def self.down
    remove_column :products, :product_type
    remove_column :products, :author
    remove_column :products, :publishing_year
    remove_column :products, :isbn
    remove_column :products, :annotation
  end
end

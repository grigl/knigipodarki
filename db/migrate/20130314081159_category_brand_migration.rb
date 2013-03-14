class CategoryBrandMigration < ActiveRecord::Migration
  def self.up
    create_table :category_brands do |t|
      t.integer :brand_id
      t.text :link
    end
  end
  
  def self.down
    drop_table :category_brands
  end
  
end

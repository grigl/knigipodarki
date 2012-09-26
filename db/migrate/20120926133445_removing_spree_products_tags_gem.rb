class RemovingSpreeProductsTagsGem < ActiveRecord::Migration
  def self.up
    drop_table :product_tags
    remove_column :products, :product_tag_id
  end

  def self.down
    create_table :product_tags, :force => true do |t|
      t.string :name
      
      t.timestamps
    end
    add_column :products, :product_tag_id, :integer
  end
end

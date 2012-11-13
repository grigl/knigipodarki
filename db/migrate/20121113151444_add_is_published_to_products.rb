class AddIsPublishedToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :is_published, :boolean, default: false
  end

  def self.down
    drop_column :products, :is_published
  end
end

class AddTaggedAsNewToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :tagged_as_new, :boolean
  end

  def self.down
    remove_column :products, :tagged_as_new
  end
end

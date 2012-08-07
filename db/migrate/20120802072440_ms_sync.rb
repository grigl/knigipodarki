class MsSync < ActiveRecord::Migration
  def self.up
    add_column :products, :external_id, :string # артикул, по нему проверяется уникальность товара
  end

  def self.down
    remove_column :products, :external_id
  end
end

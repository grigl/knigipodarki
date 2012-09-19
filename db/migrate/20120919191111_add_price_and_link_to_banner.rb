class AddPriceAndLinkToBanner < ActiveRecord::Migration
  def self.up
    add_column :banners, :price, :string
    add_column :banners, :link, :string
  end

  def self.down
    remove_column :banners, :price, :string
    remove_column :banners, :link, :string
  end
end

class AddPagesToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :pages, :integer
  end

  def self.down
    remove_column :products, :pages
  end
end

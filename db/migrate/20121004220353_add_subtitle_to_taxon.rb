class AddSubtitleToTaxon < ActiveRecord::Migration
  def self.up
    add_column :taxons, :subtitle, :string
  end

  def self.down
    remove_column :taxons, :subtitle
  end
end

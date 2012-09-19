class RemoveSomeFieldsFromProduct < ActiveRecord::Migration
  def self.up
    remove_column :products, :show_in_main_slide
    remove_column :products, :popularity
  end

  def self.down
    add_column :products, :show_in_main_slide, :boolean
    add_column :products, :popularity, :integer
  end
end

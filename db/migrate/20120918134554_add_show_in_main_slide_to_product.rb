class AddShowInMainSlideToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :show_in_main_slide, :boolean
  end

  def self.down
    remove_column :products, :show_in_main_slide
  end
end

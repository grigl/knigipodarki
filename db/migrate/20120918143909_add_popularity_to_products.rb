class AddPopularityToProducts < ActiveRecord::Migration
  def self.up
    add_column :products, :popularity, :integer
  end

  def self.down
    remove_column :products, :popularity, :integer
  end
end

class AddPopularityToProduct < ActiveRecord::Migration
  def self.up
    add_column :products, :popularity, :integer, default: 0
  end

  def self.down
    drop_column :products, :popularity
  end
end

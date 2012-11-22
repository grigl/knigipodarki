class RemovePaymentMethodNameFromProducts < ActiveRecord::Migration
  def self.up
    remove_column :products, :payment_method_name
  end

  def self.down
    add_column :products, :payment_method_name, :string
  end
end
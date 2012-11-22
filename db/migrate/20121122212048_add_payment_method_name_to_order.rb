class AddPaymentMethodNameToOrder < ActiveRecord::Migration
  def self.up
    add_column :orders, :payment_method_name, :string
  end

  def self.down
    remove_column :orders, :payment_method_name
  end
end
class PaymentDelivery < ActiveRecord::Migration
  def self.up
    create_table :payment_methods_shipping_methods, :id => false do |t|
      t.integer :payment_method_id
      t.integer :shipping_method_id
    end
    
  end

  def self.down
    drop_table :payment_methods_shipping_methods
  end
end

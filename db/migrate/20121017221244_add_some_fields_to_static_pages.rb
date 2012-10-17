class AddSomeFieldsToStaticPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :about_knigipodarki, :text
    add_column :pages, :about_contacts, :text
    add_column :pages, :payment_robokassa, :text
    add_column :pages, :payment_courier, :text
    add_column :pages, :delivery_courier, :text
    add_column :pages, :delivery_ems, :text
    add_column :pages, :delivery_postamat, :text
    add_column :pages, :delivery_pickup, :text
    add_column :pages, :business_for_suppliers, :text
    add_column :pages, :business_details, :text
    add_column :pages, :business_wholesale, :text
  end

  def self.down
    remove_column :pages, :about_knigipodarki
    remove_column :pages, :about_contacts
    remove_column :pages, :payment_robokassa
    remove_column :pages, :payment_courier
    remove_column :pages, :delivery_courier
    remove_column :pages, :delivery_ems
    remove_column :pages, :delivery_postamat
    remove_column :pages, :delivery_pickup
    remove_column :pages, :business_for_suppliers
    remove_column :pages, :business_details
    remove_column :pages, :business_wholesale
  end
end

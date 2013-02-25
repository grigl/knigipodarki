class AddPageTitles < ActiveRecord::Migration
  def self.up
    add_column :pages, :about_knigipodarki_title, :string
    add_column :pages, :about_contacts_title, :string
    add_column :pages, :payment_robokassa_title, :string
    add_column :pages, :payment_courier_title, :string
    add_column :pages, :delivery_courier_title, :string
    add_column :pages, :delivery_ems_title, :string
    add_column :pages, :delivery_postamat_title, :string
    add_column :pages, :delivery_pickup_title, :string
    add_column :pages, :business_for_suppliers_title, :string
    add_column :pages, :business_details_title, :string
    add_column :pages, :business_wholesale_title, :string    
  end

  def self.down
    remove_column :pages, :about_knigipodarki_title
    remove_column :pages, :about_contacts_title
    remove_column :pages, :payment_robokassa_title
    remove_column :pages, :payment_courier_title
    remove_column :pages, :delivery_courier_title
    remove_column :pages, :delivery_ems_title
    remove_column :pages, :delivery_postamat_title
    remove_column :pages, :delivery_pickup_title
    remove_column :pages, :business_for_suppliers_title
    remove_column :pages, :business_details_title
    remove_column :pages, :business_wholesale_title       
  end
end

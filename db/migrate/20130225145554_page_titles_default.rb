# coding: UTF-8

class PageTitlesDefault < ActiveRecord::Migration
  def self.up
    change_column_default :pages, :about_knigipodarki_title,'Магазин'
    change_column_default :pages, :about_contacts_title,'Контакты'
    change_column_default :pages, :payment_robokassa_title,'Робокасса'
    change_column_default :pages, :payment_courier_title,'Наличными курьреру'
    change_column_default :pages, :delivery_courier_title,'Курьерская'
    change_column_default :pages, :delivery_ems_title,'EMS Почта России'
    change_column_default :pages, :delivery_postamat_title,'Постамат'
    change_column_default :pages, :delivery_pickup_title,'Самовывоз'
    change_column_default :pages, :business_for_suppliers_title,'Поставщикам'
    change_column_default :pages, :business_details_title,'Реквизиты'
    change_column_default :pages, :business_wholesale_title,'Опт'      
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration, "Can't remove the default"    
  end
end

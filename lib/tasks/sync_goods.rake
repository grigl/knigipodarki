#some requires
require 'net/ftp'
#require 'net/pop'
require 'xmlsimple'
require 'mail'

ftp_host = "knigipodarki.webbyapp.com"
ftp_port = 21
ftp_user = "git"
ftp_pass = "Y3yRrVTh"
ftp_dir = "xml"
ftp_file = "store.xml"
#pop_server = "pop.mail.ru"
#pop_user = "9460116"
#pop_password = "print112233"

#если дебаг - не забираем с фтп, а используем локальный store.xml в корне
debug = false
#delete_emails = false

namespace :sync do
  desc "Sync goods"
  task :goods => :environment do
    if debug == false then
      ftp = Net::FTP.new
      ftp.passive = true
      ftp.connect(ftp_host, ftp_port)
      ftp.login(ftp_user, ftp_pass)
      ftp.chdir(ftp_dir)
      files = ftp.list("*")
      if files.count > 0 then
        datetime = DateTime.now.xmlschema
        dir = "sync/" + datetime
        file = dir + "/" + ftp_file
        Dir::mkdir(dir)
        ftp.getbinaryfile(ftp_file, file, 1024)
        ftp.delete(ftp_file)
        ftp.close
        parse_file(file)
      else
        puts "No file to parse: " + ftp_file
        ftp.close  
      end
    else
      file = "store.xml"      
      parse_file(file)
    end
  end
  
  def parse_file(file)
    main_store_id = "0ohh9g00001b"
    second_store_id = "00000100001h"    
    third_store_id = "0000010005A9"
    
    xml = ""
    count = 0
    File.open(file, "r:cp1251") do |infile|
      while (line = infile.gets)
        if count == 0 then
          xml += '<?xml version="1.0" encoding="utf-8"?>'
        else
          xml += line.force_encoding("UTF-8")
        end
        count += 1
      end
    end
    
    config = XmlSimple.xml_in(xml)
        
    found_ids = []    
        
    main_store = []
    second_store = []
    third_store = []
        
    config["store"].each do|store|
      store_id = store["id"][0]
      if store_id == main_store_id
        main_store = store        
      end
      if store_id == second_store_id
        second_store = store           
      end
      
      if store_id == third_store_id
        third_store = store          
      end
    end  
    
    main_store["items"][0]["item"].each do|item|
      external_id = item["id"][0]
      sku = item["code"][0]
      name = item["modelg"][0]
      supplier = item["firmag"][0]
      found_ids.push(external_id)
      groupg = ''
      typeg = ''
      if item["groupg"].count
        groupg = item["groupg"][0]
      end
      if item["typeg"].count
        typeg = item["typeg"][0]
      end          
      category_name = groupg.to_s + " " + typeg.to_s
      count_on_hand = item["count"][0].to_i
          
      price = 0
      item["prices"][0]["price"].each do|price_variant|
        if price_variant["order"][0].to_i == 4 then
          price = price_variant["value"][0]
        end
      end
          
      product = Product.where("BINARY external_id = ?", external_id).limit(1)
      if product.empty?
        product = Product.new
        product.name = name
        product.subname = name
        product.supplier = supplier
        product.category_name = category_name
        product.external_id = external_id
        product.sku = sku
        product.permalink = sku
        product.isbn = sku
      else
        product = product[0]
      end
      product.price = price
      product.subname = name
      product.supplier = supplier
      product.category_name = category_name      
      product.master.count_on_hand = count_on_hand
      product.master.count_on_hand_add = ''
      product.master.count_on_hand_add2 = ''
      product.save
    end  
    
    second_store["items"][0]["item"].each do|item|
      external_id = item["id"][0]
      count_on_hand_add = item["count"][0].to_i
          
      product = Product.where("BINARY external_id = ?", external_id).limit(1)
      if not product.empty?
        product = product[0]
        product.master.count_on_hand_add = count_on_hand_add
        product.save
      end
    end      
    
    third_store["items"][0]["item"].each do|item|
      external_id = item["id"][0]
      count_on_hand_add = item["count"][0].to_i
          
      product = Product.where("external_id = ?", external_id).limit(1)
      if not product.empty?
        product = product[0]
        product.master.count_on_hand_add2 = count_on_hand_add
        product.save
      end
    end   
    
    products = Product.where("BINARY external_id NOT IN (?)", found_ids)
    products.each do|product|
      product.deleted_at = Time.now()
      
      product.variants.each do |v|
        v.deleted_at = Time.now()
        v.save
      end
  
      product.save      
    end
      
  end
end

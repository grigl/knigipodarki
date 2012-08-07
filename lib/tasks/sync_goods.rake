#some requires
require 'net/ftp'
require 'xmlsimple'

ftp_host = "188.40.112.213"
ftp_port = 21
ftp_user = "storesync"
ftp_pass = "THEy89SIbb$"
ftp_dir = "tdt"
ftp_file = "store.xml"

#если дебаг - не забираем с фтп, а используем локальный store.xml в корне
debug = true

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
      else
        puts "No file to parse: " + ftp_file
        ftp.close  
      end
    else
      file = "store.xml"      
    end
    
    
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
        
    config["store"][0]["items"][0]["item"].each do|item|
      external_id = item["id"][0]
      sku = item["code"][0]
      name = sku
      count_on_hand = item["count"][0].to_i
      
      price = 0
      item["prices"][0]["price"].each do|price_variant|
        if price_variant["order"][0].to_i == 4 then
          price = price_variant["value"][0]
        end
      end
      
      product = Product.where("external_id = ?", external_id).limit(1)
      if product.empty?
        product = Product.new
        product.name = name
        product.external_id = external_id
        product.sku = sku
        product.permalink = sku
      else
        product = product[0]
      end
      product.price = price
      product.master.count_on_hand = count_on_hand
      product.save
    end  
  end
end
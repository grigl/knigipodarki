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
      
      #Net::POP3.start(pop_server, nil, pop_user, pop_password) do |pop|
      #  if pop.mails.empty? then
      #    puts "NO MAILS" 
      #  else
      #    pop.mails.each do |mail|        
      #      puts "receiving mail..."
      #      email = Mail.read_from_string(mail.pop)
      #      email.attachments.each do | attachment |
      #        datetime = DateTime.now.xmlschema
      #        dir = "sync/" + datetime
      #        file = dir + "/" + ftp_file
      #        Dir::mkdir(dir)              
      #        filename = attachment.filename
      #        begin
      #          File.open(file, "w+b", 0644) {|f| f.write attachment.body.decoded}
      #          parse_file(file)
      #        rescue Exception => e
      #          puts "Unable to save data for #{filename} because #{e.message}"
      #        end
      #      end
      #      if delete_emails == true
      #        email.delete  
      #      end
      #    end
      #  end
      #end      
    else
      file = "store.xml"      
      parse_file(file)
    end
  end
  
  def parse_file(file)
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
      name = item["modelg"][0]
      supplier = item["firmag"][0]
      category_name = item["groupg"][0] + " " + item["typeg"][0]
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
        product.subname = name
        product.supplier = supplier
        product.category_name = category_name
        product.external_id = external_id
        product.sku = sku
        product.permalink = sku
      else
        product = product[0]
      end
      product.price = price
      product.subname = name
      product.supplier = supplier
      product.category_name = category_name      
      product.master.count_on_hand = count_on_hand
      product.save
    end    
  end
end

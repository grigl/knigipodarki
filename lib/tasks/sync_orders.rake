#some requires
require 'net/ftp'
#require 'net/pop'
require 'xmlsimple'
require 'mail'

ftp_host = "knigipodarki.webbyapp.com"
ftp_port = 21
ftp_user = "git"
ftp_pass = "Y3yRrVTh"
ftp_dir = "xml/order"
ftp_file = "order.xml"
#pop_server = "pop.mail.ru"
#pop_user = "9460116"
#pop_password = "print112233"
cash_id = "00000100001b"
wh_id = "0ohh9g00001b"

debug = false
#delete_emails = false

namespace :sync do
  desc "Sync orders"
  task :orders => :environment do
    datetime = DateTime.now.strftime('%Y%m%d%H%M%S')
    xml_file = "syncorders/" + datetime + "_" + ftp_file
    
    #last_order_time = File.read(".last_order")
    orders = Order.where('completed_at IS NOT NULL AND (is_sync = ? OR is_sync IS NULL)', false)
    if orders.count == 0 then
      return
    end 
    
    new_order_time = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
    #File.open('.last_order', 'w') {|f| f.write(new_order_time.to_s) }    
        
    xml = '<?xml version="1.0" encoding="UTF-8"?>'
    xml += '<root>'                              
    orders.each do|order|
      order.is_sync = true
      order.save()
      xml += '<order>'
      xml += '<typedoc>7</typedoc>'
      xml += '<cashid>'+cash_id+'</cashid>'
      xml += '<date>'+order.completed_at.strftime('%Y.%m.%d')+'</date>'
      xml += '<number>'+order.id.to_s+'</number>'
      xml += '<items>'
      order.line_items.each do|line_item|
        xml += '<item>'
        xml += '<id>'+line_item.product.external_id+'</id>'
        xml += '<folderid>'+wh_id+'</folderid>'
        xml += '<count>'+line_item.quantity.to_s+'</count>'
        xml += '<value>'+(line_item.price*line_item.quantity).to_s+'</value>'
        xml += '</item>'
      end      
      xml += '</items>'
      xml += '</order>'      
    end
    xml += '</root>'
    
    File.open(xml_file, 'w') {|f| f.write(xml)}
    
    ftp = Net::FTP.new
    ftp.passive = true
    ftp.connect(ftp_host, ftp_port)
    ftp.login(ftp_user, ftp_pass)
    ftp.chdir(ftp_dir)
    ftp.puttextfile(xml_file)
    ftp.close        
  end  
end

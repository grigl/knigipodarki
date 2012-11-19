#some requires
require 'net/ftp'
#require 'net/pop'
require 'xmlsimple'
require 'mail'

ftp_host = "knigipodarki.webbyapp.com"
ftp_port = 21
ftp_user = "git"
ftp_pass = "Y3yRrVTh"
ftp_dir = "xml/order/error"
ftp_file = "store.xml"
#pop_server = "pop.mail.ru"
#pop_user = "9460116"
#pop_password = "print112233"

#если дебаг - не забираем с фтп, а используем локальный store.xml в корне
debug = false
#delete_emails = false

namespace :sync do
  desc "Sync cancels"
  task :cancel => :environment do
    if debug == false then
      ftp = Net::FTP.new
      ftp.passive = true
      ftp.connect(ftp_host, ftp_port)
      ftp.login(ftp_user, ftp_pass)
      ftp.chdir(ftp_dir)
      files = ftp.list("*")
      if files.count > 0 then
        files.each do|ftp_file|
          ftp_file = ftp_file.split(/\s+/).last
          datetime = DateTime.now.xmlschema
          dir = "synccancel/" + datetime
          file = dir + "/" + ftp_file
          Dir::mkdir(dir)
          ftp.gettextfile(ftp_file, file)
          ftp.delete(ftp_file)
          parse_cancel_file(file)
        end
      ftp.close
      else
        puts "No file to parse: " + ftp_file
        ftp.close  
      end   
    else
      file = "store.xml"      
      parse_file(file)
    end
  end
  
  def parse_cancel_file(file)
    xml = ""
    count = 0
    File.open(file, "r:utf8") do |infile|
      while (line = infile.gets)
          xml += line
        count += 1
      end
    end
    
    config = XmlSimple.xml_in(xml)
        
    config["order"].each do|order|
      order_id = order["number"][0].to_i
      orders = Order.where('id = ?', order_id)
      if not orders.empty?
        order = orders[0]
        order.send('cancel')
      end 
    end     
  end
end

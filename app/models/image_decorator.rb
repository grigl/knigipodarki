Image.class_eval do
  has_attached_file :attachment,
                    :styles => { :mini => '60x60>', :small => '100x100>', :product => '180x180>', :large => '302x302>' },
                    :default_style => :product,
                    :url => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
end

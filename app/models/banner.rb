class Banner < ActiveRecord::Base
  attr_accessible :asset, :title, :subtitle, :link, :price, :description
  has_attached_file :asset,
                :styles => { :main => '300x300>', :thumb => '30x30>'},
                :default_style => :main,
                :url => "/assets/banners/:id/:style/:basename.:extension",
                :path => ":rails_root/public/assets/banners/:id/:style/:basename.:extension"
end

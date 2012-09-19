class Banner < ActiveRecord::Base
  attr_accessible :asset
  has_attached_file :asset,
                :styles => { :main => '300x300>', :thumb => '30x30>'},
                :default_style => :main,
                :url => "/assets/banners/:id/:style/:basename.:extension",
                :path => ":rails_root/public/assets/banners/:id/:style/:basename.:extension"

  validates :title, presence: true
end

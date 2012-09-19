class Banner < ActiveRecord::Base
  has_one :banner_image, :as => :viewable, :dependent => :destroy

  validates :title, presence: true
  validates :description, presence: true
end

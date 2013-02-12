# encoding: utf-8
Address.class_eval do
  #validates :secondname, presence: true
  validates :firstname, :lastname, :city, :country, :phone, :presence => true
  validates :zipcode, format: { with: /[0-9]+/, message: 'может содержать только цифры' }, :allow_blank => true
  validates :phone, format: { with: /^[-+()\/\s\d]+$/, message: 'имеет неверный формат' }
  validates :address1, :allow_blank => true
  
  def to_s
    "#{lastname} #{firstname} #{secondname}: #{zipcode}, #{country}, #{state || state_name}, #{city}, #{address1}"
  end
end
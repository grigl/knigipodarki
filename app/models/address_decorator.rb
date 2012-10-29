# encoding: utf-8
Address.class_eval do
  validates :secondname, presence: true
  validates :zipcode, format: { with: /[0-9]+/, message: 'может содержать только цифры' }
  validates :phone, format: { with: /^[-+()\/\s\d]+$/, message: 'имеет неверный формат' }

  def to_s
    "#{firstname} #{lastname} #{secondname}: #{zipcode}, #{country}, #{state || state_name}, #{city}, #{address1}"
  end
end
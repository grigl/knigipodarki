PaymentMethod.class_eval do
  has_and_belongs_to_many :shipping_methods
end
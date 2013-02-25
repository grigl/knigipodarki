ShippingMethod.class_eval do
  has_and_belongs_to_many :payment_methods
end

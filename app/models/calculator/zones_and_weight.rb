# encoding:utf-8
class Calculator::ZonesAndWeight < Calculator
  preference :categories, :text, :default => ''
  preference :multiplier, :decimal, :default => 1

  def self.description
    'Калькулятор тарифов в зависимости от веса товара'
  end

  def self.register
    super
    ShippingMethod.register_calculator(self)
  end

  def compute(object)
    return unless object.present? && object.line_items.present?

    current_amount = 0
    categories = self.preferred_categories.split(';')
    last_category = categories.pop if categories

    if categories
      categories_dict = [] # meke dict from categories
      categories.each do |cat|
        category = cat.split('-')
        categories_dict << { weight: category[0].to_i, amaunt: category[1].to_i }
      end
    end

    line_items = object.line_items
    current_weight = line_items.map { |item| item.variant.weight.present? ? item.variant.weight*item.quantity : 2000*item.quantity }.sum

    if categories_dict
      categories_dict.sort {|cat1,cat2| cat1[:weight] <=> cat2[:weight]}
      categories_dict.each do |cat|
        if current_weight <= cat[:weight]
          current_amount = cat[:amaunt]
          break
        end
        current_amount = last_category.to_i 
      end
    end

    return current_amount
  end
end

Order.class_eval do
  def add_variant(variant, quantity = 1)
    current_item = contains?(variant)

    if current_item
      current_item.quantity += quantity
      current_item.save
    else
      current_item = LineItem.new(:quantity => quantity)
      current_item.variant = variant
      if variant.product.sale_price
        current_item.price = variant.product.sale_price
      else
        current_item.price = variant.price
      end
      self.line_items << current_item
    end

    # populate line_items attributes for additional_fields entries
    # that have populate => [:line_item]
    Variant.additional_fields.select{|f| !f[:populate].nil? && f[:populate].include?(:line_item) }.each do |field|
      value = ""

      if field[:only].nil? || field[:only].include?(:variant)
        value = variant.send(field[:name].gsub(" ", "_").downcase)
      elsif field[:only].include?(:product)
        value = variant.product.send(field[:name].gsub(" ", "_").downcase)
      end
      current_item.update_attribute(field[:name].gsub(" ", "_").downcase, value)
    end

    # increasing popularity
    product = variant.product
    product.popularity += 1
    product.save

    current_item
  end

  def contains?(variant)
    line_items.detect{|line_item| line_item.variant_id == variant.id && (variant.product.sale_price ? variant.product.sale_price==line_item.price : variant.price==line_item.price)}
  end

  # Finalizes an in progress order after checkout is complete.
  # Called after transition to complete state when payments will have been processed
  def finalize!
    update_attribute(:completed_at, Time.now)
    update_attribute(:payment_method_name, self.payment_method.name) unless self.payment_method_name
    self.out_of_stock_items = InventoryUnit.assign_opening_inventory(self)
    # lock any optional adjustments (coupon promotions, etc.)
    adjustments.optional.each { |adjustment| adjustment.update_attribute("locked", true) }

    self.state_events.create({
      :previous_state => "cart",
      :next_state     => "complete",
      :name           => "order" ,
      :user_id        => (User.respond_to?(:current) && User.current.try(:id)) || self.user_id
    })
  end
 
  def payment_method
    return payments.last
  end 
 
  def after_cancel
    OrderMailer.cancel_email(self).deliver
    OrderMailer.cancel_admin_email(self).deliver
  end 
  
  def update_shipment_state
    if shipments.empty?
      self.shipment_state = "pending"
    else
      self.shipment_state = shipments[0].state
      self.shipment_state = "backorder" if backordered?
  
      if old_shipment_state = self.changed_attributes["shipment_state"]
        self.state_events.create({
          :previous_state => old_shipment_state,
          :next_state     => self.shipment_state,
          :name           => "shipment" ,
          :user_id        => (User.respond_to?(:current) && User.current && User.current.id) || self.user_id
        })
      end      
    end
  end  
end

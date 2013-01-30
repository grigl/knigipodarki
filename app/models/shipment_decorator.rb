Shipment.class_eval do
  after_update :send_email, :if => :state_changed?
 
  scope :shipped, where(:state => 'shipped')
  scope :ready, where(:state => 'ready')
  scope :pending, where(:state => 'pending')
  scope :assemble, where(:state => 'assemble')
  scope :assemble_done, where(:state => 'assemble_done')
  scope :ready_to_ship, where(:state => 'ready_to_ship')

  state_machine :initial => 'pending', :use_transactions => false do
    state :shipped
    state :ready
    state :pending
    state :assemble
    state :assemble_done
    state :ready_to_ship
    after_transition :to => 'shipped', :do => :after_ship
  end
  
  def determine_state(order)
    return "shipped" if state == "shipped"
    return "ready" if state == "ready"
    return "pending" if state == "pedning"
    return "assemble" if state == "assemble"
    return "assemble_done" if state == "assemble_done"
    return "ready_to_ship" if state == "ready_to_ship"
    order.payment_state == "balance_due" ? "pending" : "ready"
  end  
  
  def send_email
    if self.state == 'ready_to_shop' or self.state == 'shipped'
      OrderMailer.status_change_email(self.order).deliver      
    end
  end
end
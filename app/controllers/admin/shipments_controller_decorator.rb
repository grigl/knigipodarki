Admin::ShipmentsController.class_eval do
  before_filter :load_order
  before_filter :load_shipment, :only => [:destroy, :edit, :update, :fire]
  before_filter :load_shipping_methods, :except => [:country_changed, :index]

  respond_to :html

end

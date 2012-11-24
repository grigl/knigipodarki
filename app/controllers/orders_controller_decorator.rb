OrdersController.class_eval do
  respond_to :html, :js

  helper :products

  def show
    @order = Order.find_by_number(params[:id])

    render_404 unless @order
  end

  def update
    @order = current_order
    if @order.update_attributes(params[:order])
      @order.line_items = @order.line_items.select {|li| li.quantity > 0 }
      respond_with(@order) { |format| format.html { redirect_to cart_path } }
    else
      respond_with(@order)
    end
  end

  # Shows the current incomplete order from the session
  def edit
    @order = current_order(true)
  end

  # Adds a new item to the order (creating a new order if none already exists)
  #
  # Parameters can be passed using the following possible parameter configurations:
  #
  # * Single variant/quantity pairing
  # +:variants => {variant_id => quantity}+
  #
  # * Multiple products at once
  # +:products => {product_id => variant_id, product_id => variant_id}, :quantity => quantity +
  # +:products => {product_id => variant_id, product_id => variant_id}}, :quantity => {variant_id => quantity, variant_id => quantity}+
  def populate
    @order = current_order(true)

    params[:products].each do |product_id,variant_id|
      variant = Variant.find(variant_id)
      # variant_qty_in_cart = @order.line_items.find_by_variant_id(variant_id).quantity rescue 0
      variant_qty_in_cart = @order.line_items.select {|l_item| l_item.variant.id == variant.id}.map {|l_item| l_item.quantity}.sum rescue 0

      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)

      if variant_qty_in_cart + quantity > variant.count_on_hand
        quantity = variant.count_on_hand - variant_qty_in_cart
      end

      @order.add_variant(variant, quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      variant = Variant.find(variant_id)
      # variant_qty_in_cart = @order.line_items.find_by_variant_id(variant_id).quantity rescue 0
      variant_qty_in_cart = @order.line_items.select {|l_item| l_item.variant.id == variant.id}.map {|l_item| l_item.quantity}.sum rescue 0

      if variant_qty_in_cart + quantity.to_i > variant.count_on_hand
        quantity = variant.count_on_hand - variant_qty_in_cart
      else
        quantity = quantity.to_i
      end

      @order.add_variant(variant, quantity) if quantity > 0
    end if params[:variants]

    @order.update!
    respond_with(@order) { |format| format.js { render :reload_cart } }
  end

  def plus_line_item
    @order = current_order
    variant = @order.line_items.find(params[:id]).variant
    line_item = @order.line_items.detect{|line_item| line_item.variant_id == variant.id && (variant.product.sale_price ? variant.product.sale_price==line_item.price : variant.price==line_item.price)}

    if line_item
      variant_qty_in_cart = @order.line_items.select {|l_item| l_item.variant.id == variant.id}.map {|l_item| l_item.quantity}.sum rescue 0
      unless variant_qty_in_cart + 1 > line_item.variant.on_hand
        line_item.quantity += 1
        line_item.save
      end
      @order.update!
      respond_with(@order) { |format| format.js { render :reload_cart } }
    else
      @order.add_variant(variant, 1)
      @order.update!
      respond_with(@order) { |format| format.js { render :reload_cart } }
    end
  end

  def minus_line_item
    @order = current_order
    line_item = @order.line_items.find(params[:id])

    if line_item
      if line_item.quantity - 1 == 0
        line_item.destroy
        @order.update!
        respond_with(@order) { |format| format.js { render :reload_cart } }
      else
        line_item.quantity -= 1
        line_item.save
        @order.update!
        respond_with(@order) { |format| format.js { render :reload_cart } }
      end
    else
      respond_with(@order) { |format| format.js { render 'shared/alert_errors' } }
    end
  end

  def delete_line_item
    @order = current_order
    line_item = @order.line_items.find(params[:id])

    if line_item
      line_item.destroy
      @order.update!
      respond_with(@order) { |format| format.js { render :reload_cart } }
    else
      respond_with(@order) { |format| format.js { render 'shared/alert_errors' } }
    end
  end

  def empty
    if @order = current_order
      @order.line_items.destroy_all
    end
    
    respond_with(@order) { |format| format.html { redirect_to cart_path } }
  end

  def update_comment
  end

  def accurate_title
    @order && @order.completed? ? "#{Order.human_name} #{@order.number}" : I18n.t(:shopping_cart)
  end
end

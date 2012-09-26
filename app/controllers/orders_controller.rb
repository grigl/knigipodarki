class OrdersController < Spree::BaseController
  respond_to :html, :js

  helper :products


  def show
    @order = Order.find_by_number(params[:id])
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
      quantity = params[:quantity].to_i if !params[:quantity].is_a?(Hash)
      quantity = params[:quantity][variant_id].to_i if params[:quantity].is_a?(Hash)
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:products]

    params[:variants].each do |variant_id, quantity|
      quantity = quantity.to_i
      @order.add_variant(Variant.find(variant_id), quantity) if quantity > 0
    end if params[:variants]

    @order.update!
    respond_with(@order) { |format| format.js { render :reload_cart } }
  end

  def plus_line_item
    @order = current_order
    line_item = @order.line_items.find(params[:id])

    # to do on_hand validation
    if line_item
      line_item.quantity += 1
      line_item.save
      @order.update!
      respond_with(@order) { |format| format.js { render :reload_cart } }
    else
      respond_with(@order) { |format| format.js { render 'shared/alert_errors' } }
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

  def accurate_title
    @order && @order.completed? ? "#{Order.human_name} #{@order.number}" : I18n.t(:shopping_cart)
  end
end
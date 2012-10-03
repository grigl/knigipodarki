class ProductsController < Spree::BaseController
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper :taxons

  respond_to :html

  def index
    if params[:sort] == 'price'
      @products = Product.all.sort_by! { |product| product.master.price }.paginate(:page => params[:page], :per_page => 30)
    else      
      params[:sort] ? (sort = params[:sort]) : (sort = 'created_at')
      @products = Product.order("#{sort} DESC").paginate(:page => params[:page], :per_page => 30)
    end

    respond_with(@products)
  end

  def show
    @product = Product.find_by_permalink!(params[:id])
    return unless @product

    @variants = Variant.active.includes([:option_values, :images]).where(:product_id => @product.id)
    @product_properties = ProductProperty.includes(:property).where(:product_id => @product.id)
    @selected_variant = @variants.detect { |v| v.available? }

    referer = request.env['HTTP_REFERER']

    if referer && referer.match(HTTP_REFERER_REGEXP)
      @taxon = Taxon.find_by_permalink($1)
    end

    respond_with(@product)
  end

  private

  def accurate_title
    @product ? @product.name : super
  end
end

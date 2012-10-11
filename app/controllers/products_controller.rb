# encoding: utf-8
class ProductsController < Spree::BaseController
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper :taxons

  respond_to :html

  def index
    products = Product.order('created_at')
    # scopes
    if params[:scope] 
      products = eval "products.#{params[:scope]}_products"
    end

    if params[:keywords] 
      products = products.where('name LIKE ?', "%#{params[:keywords]}%")
    end

    # sorting and order
    if params[:sort] 
      if params[:order] == 'DESC'
        products = products.sort_by! { |product| product.try(params[:sort]) }.reverse
      else
        products = products.sort_by! { |product| product.try(params[:sort]) }
      end
    else
      if params[:order] == 'DESC'
        products = products.sort_by! { |product| product.created_at }.reverse
      else
        products = products.sort_by! { |product| product.created_at }
      end
    end

    @products = products.paginate(:page => params[:page], :per_page => 8)

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

  def tags
    @tag = Tag.find_by_name!(params[:tag])
    products = @tag.products

    @products = products.paginate(:page => params[:page], :per_page => 8)

    respond_with(@product) { |format| format.html { render :index } }
  end

  private

  def accurate_title
    @product ? @product.name : super
  end
end

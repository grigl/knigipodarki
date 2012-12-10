# encoding: utf-8
class ProductsController < Spree::BaseController
  HTTP_REFERER_REGEXP = /^https?:\/\/[^\/]+\/t\/([a-z0-9\-\/]+)$/
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper :taxons

  respond_to :html

  def new
    render_404
  end

  def index
    products = Product.order('created_at DESC').not_deleted.published
    # scopes
    if params[:scope] 
      products = eval "products.#{params[:scope]}_products"
    end

    if params[:keywords] 
      products_by_name = products.where('name LIKE ?', "%#{params[:keywords]}%")
      products_by_description = products.where('description LIKE ?', "%#{params[:keywords]}%")

      publishers_taxonomy = Taxonomy.where(name: 'Издательства').first
      publishers = Taxon.where(taxonomy_id = publishers_taxonomy.id).where('name LIKE ?', "%#{params[:keywords]}%")
      products_by_publishers = []
      if publishers
        publishers.each do |publisher|
          publisher_products = publisher.all_products.not_deleted.published
          publisher_products.each do |product|
            products_by_publishers << product unless products_by_publishers.include?(product)
          end if publisher_products
        end
      end
      products_by_isbn = products.select {|product| product.isbn.gsub('-','').include?(params[:keywords].gsub('-','')) } 

      products = products_by_name
      products_by_description.each do |product|
        products << product unless products.include?(product)
      end
      products_by_publishers.each do |product|
        products << product unless products.include?(product)
      end
      products_by_isbn.each do |product|
        products << product unless products.include?(product)
      end
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

  def edit
    render_404
  end

  def show
    @product = Product.find_by_permalink!(params[:id])
    return unless @product
    if @product.deleted_at || !@product.is_published
      render_404
    else
      @variants = Variant.active.includes([:option_values, :images]).where(:product_id => @product.id)
      @product_properties = ProductProperty.includes(:property).where(:product_id => @product.id)
      @selected_variant = @variants.detect { |v| v.available? }

      referer = request.env['HTTP_REFERER']

      if referer && referer.match(HTTP_REFERER_REGEXP)
        @taxon = Taxon.find_by_permalink($1)
      end

      respond_with(@product)
    end
  end

  def tags
    @tag = Tag.find_by_name!(params[:tag])
    products = @tag.products.not_deleted.published

    @products = products.paginate(:page => params[:page], :per_page => 8)

    respond_with(@product) { |format| format.html { render :index } }
  end

  private

  def accurate_title
    @product ? @product.name : super
  end
end

class TaxonsController < Spree::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  
  helper :products

  respond_to :html

   def index
    permalink = '/' + params[:taxonomy]
    @taxon = Taxon.find_by_permalink!(permalink)
    return unless @taxon

    respond_with(@taxon)
  end

  def show
    if params[:subtaxon]
      permalink = '/' + params[:taxonomy] + '/' + params[:taxon] + '/' + params[:subtaxon]
    else
      permalink = '/' + params[:taxonomy] + '/' + params[:taxon]
    end

    @taxon = Taxon.find_by_permalink!(permalink)

    products = @taxon.all_products.select {|product| !product.deleted_at && product.is_published }

    # sorting and order
    if params[:sort] == 'created_at' 
      params[:sort] = 'id'
    end    
    if params[:sort] 
      if params[:order] == 'DESC'
        products = products.sort_by! { |product| product.try(params[:sort]) }.reverse
      else
        products = products.sort_by! { |product| product.try(params[:sort]) }
      end
    else
      if params[:order] == 'DESC'
        products = products.sort_by! { |product| product.id }.reverse
      else
        products = products.sort_by! { |product| product.id }
      end
    end

    # material for passport goods
    if params[:material] && params[:material] != 'all'
      products = products.select { |product| product.material == params[:material] }
    end

    @products = products.paginate(:page => params[:page], :per_page => 32)
    respond_with(@taxon)
  end

  def show_for_brands_and_categories
    brand_permalink = '/' + params[:taxonomy] + '/' + params[:brand]
    @taxon = Taxon.find_by_permalink!(brand_permalink)

    if params[:subcategory]
      category_permalink = '/categories/' + params[:category] + '/' + params[:subcategory]
    else
      category_permalink = '/categories/' + params[:category]
    end

    @category = Taxon.find_by_permalink!(category_permalink)

    products = @taxon.all_products & @category.all_products
    products = products.select {|product| !product.deleted_at && product.is_published }

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

    @products = products.paginate(:page => params[:page], :per_page => 32)
    respond_with(@products) { |format| format.html { render :show } }
  end

  private

  def accurate_title
    @taxon ? @taxon.name : super
  end
end

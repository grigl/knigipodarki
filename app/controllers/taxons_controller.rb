class TaxonsController < Spree::BaseController

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
    return unless @taxon

    products = @taxon.all_products

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

    @products = products.paginate(:page => params[:page], :per_page => 30)
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

    @products = products.paginate(:page => params[:page], :per_page => 30)
    respond_with(@products) { |format| format.html { render :show } }
  end

  private

  def accurate_title
    @taxon ? @taxon.name : super
  end
end

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
    return unless @taxon

    products = @taxon.products

    if @taxon.children
      @taxon.children.each do |taxon|
        products += taxon.products
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

    @products = products.paginate(:page => params[:page], :per_page => 30)
    respond_with(@taxon)
  end

  private

  def accurate_title
    @taxon ? @taxon.name : super
  end
end

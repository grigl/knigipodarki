class TaxonsController < Spree::BaseController
  rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  helper :products

  respond_to :html

   def index
    permalink = '/' + params[:taxonomy]
    @taxon = Taxon.find_by_permalink!(permalink)
    return unless @taxon

    @searcher = Spree::Config.searcher_class.new(params.merge(:taxon => @taxon.id))
    @products = @searcher.retrieve_products

    respond_with(@taxon)
  end

  def show
    permalink = '/' + params[:taxonomy] + '/' + params[:taxon]
    @taxon = Taxon.find_by_permalink!(permalink)
    return unless @taxon

    @products = @taxon.products.order('created_at DESC').paginate(:page => params[:page], :per_page => 30)

    respond_with(@taxon)
  end

  private

  def accurate_title
    @taxon ? @taxon.name : super
  end
end

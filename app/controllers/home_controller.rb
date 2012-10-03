class HomeController < Spree::BaseController
  helper :products, :taxons

  def index
    @banners = Banner.order('created_at DESC')
    @recommended_products = Product.where(recommended: true)
    @tags = Tag.all
  end
end

class HomeController < Spree::BaseController
  helper :products, :taxons

  def index
    @banners = Banner.order('created_at DESC')
  end
end

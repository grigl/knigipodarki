class HomeController < Spree::BaseController
  helper :products, :taxons

  def index
    @banners = Banner.order('created_at DESC')
    @recommended_products = Product.recommended_products.published
    @popular_products = Product.popular_products.published
    @sale_products = Product.sale_products.published
    @tags = Tag.all.select {|tag| tag.products.not_deleted.published.present? }
  end
end

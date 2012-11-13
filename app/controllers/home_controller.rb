class HomeController < Spree::BaseController
  helper :products, :taxons

  def index
    @banners = Banner.order('created_at DESC')
    @recommended_products = Product.recommended_products
    @popular_products = Product.popular_products
    @sale_products = Product.sale_products
    @tags = Tag.all.select {|tag| tag.products.not_deleted.present? }
  end
end

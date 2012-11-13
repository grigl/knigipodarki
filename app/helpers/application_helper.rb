# encoding: utf-8
module ApplicationHelper
  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end
  
  def all_categories
    Taxonomy.find_by_name('Категории').root.children rescue nil
  end

  def get_subcategory(params)
    permalink = '/' + params[:taxonomy] + '/' + params[:taxon]
    Taxon.find_by_permalink(permalink)
  end

  def brand_categories(brand, category = nil)
    if category
      categories = category.children
    else
      categories = all_categories
    end

    categories.select { |cat| (cat.all_products.not_deleted.published & brand.all_products.not_deleted.published) != [] }
  end
end

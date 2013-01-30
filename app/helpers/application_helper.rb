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
    result = Taxon.find_by_permalink(permalink)
    result.children = result.children.sort_by { |v| v[:name] }
    return result
  end

  def brand_categories(brand, category = nil)
    if category
      categories = category.children
    else
      categories = all_categories
    end
    categories = categories.sort_by { |v| v[:name] }

    categories.select { |cat| (cat.all_products.select {|product| !product.deleted_at && product.is_published } & brand.all_products.select {|product| !product.deleted_at && product.is_published }) != [] }
  end
end

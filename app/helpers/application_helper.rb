# encoding: utf-8
module ApplicationHelper
  def all_categories
    Taxonomy.find_by_name('Категории').root.children rescue nil
  end

  def get_subcategory(params)
    permalink = '/' + params[:taxonomy] + '/' + params[:taxon]
    Taxon.find_by_permalink(permalink)
  end
end

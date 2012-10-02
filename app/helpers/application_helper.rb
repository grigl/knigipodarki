# encoding: utf-8
module ApplicationHelper
  def all_categories
    Taxonomy.find_by_name('Категории').root.children rescue nil
  end
end

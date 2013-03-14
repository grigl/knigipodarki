# encoding: utf-8
namespace :relation do
  desc "Create category <-> brand relation"
  task :category_brand => :environment do
    #publishers
    permalinks = ['/publishers', '/designers']
    links = Hash.new
    permalinks.each do|permalink|
      taxon = Taxon.find_by_permalink!(permalink)    
      brands = taxon.children_sorted
      brands.each do|brand|
        links[brand.id] = Hash.new
        categories = brand_categories(brand)
        categories.each do|category|
          subcategories = brand_categories(brand, category)
          subcategories.each do|subcategory|
            if subcategory.id != 2 then
              links[brand.id][subcategory.id] = '<a href="'+permalink+'/'+[brand.permalink_end, category.permalink_end, subcategory.permalink_end].join('/')+'">'+subcategory.name+'</a>'
            end
          end        
        end
      end
    end
    puts 'Filling database'
    links.each do|brand_id, brand_link|
      CategoryBrand.where('brand_id = ?', brand_id).delete_all()
      brand_link.each do|category_id, link|
        category_brand = CategoryBrand.new
        category_brand.brand_id = brand_id
        category_brand.link = link
        category_brand.save
      end
    end
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
  
  def all_categories
    Taxonomy.find_by_name('Категории').root.children rescue nil
  end  
end

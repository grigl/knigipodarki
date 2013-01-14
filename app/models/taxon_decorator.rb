Taxon.class_eval do 
  acts_as_nested_set :dependent => :destroy

  belongs_to :taxonomy
  has_and_belongs_to_many :products
  before_create :set_permalink
  before_save :destroy_icon_if_needed

  validates :name, :presence => true
  has_attached_file :icon,
                :styles => { :mini => '32x32>', :normal => '300x300>' },
                :default_style => :mini,
                :url => "/assets/taxons/:id/:style/:basename.:extension",
                :path => ":rails_root/public/assets/taxons/:id/:style/:basename.:extension",
                :default_url => "/images/default_taxon.png"

  attr_accessor :destroy_icon

  include ::ProductFilters  # for detailed defs of filters

  def children_sorted
    result = self.children.sort_by { |v| v[:name] }
    return result
  end

  # indicate which filters should be used for a taxon
  # this method should be customized to your own site
  def applicable_filters
    fs = []
    # fs << ProductFilters.taxons_below(self)
    ## unless it's a root taxon? left open for demo purposes

    fs << ProductFilters.price_filter if ProductFilters.respond_to?(:price_filter)
    fs << ProductFilters.brand_filter if ProductFilters.respond_to?(:brand_filter)
    fs
  end

  def destroy_icon_if_needed
    return unless self.destroy_icon == '1' && self.icon
    self.icon.clear
  end

  # Creates permalink based on .to_url method provided by stringx gem
  def set_permalink
    if parent_id.nil?
      self.permalink = name.to_url if self.permalink.blank?
    else
      parent_taxon = Taxon.find(parent_id)
      self.permalink = [parent_taxon.permalink, (self.permalink.blank? ? name.to_url : self.permalink.split("/").last)].join('/')
    end
  end

  def active_products
    scope = self.products.active
    scope = scope.on_hand unless Spree::Config[:show_zero_stock_products]
    scope
  end

  def all_products
    all_products = self.products
    if self.children.present?
      self.children.each do |taxon|
        taxon.products.each do |product|
          all_products << product unless all_products.include?(product)
        end
      end
    end
    all_products
  end

  def permalink_end
    self.permalink.split("/").last
  end

  private
  # obsolete, kept for backwards compat
  def escape(str)
    str.blank? ? "" : str.to_url
  end
end

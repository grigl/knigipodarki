Country.class_eval do
  has_many :states, :order => 'sort'
end
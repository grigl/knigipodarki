Knigipodarki::Application.routes.draw do
  root to: "home#index"

  post 'cart/minus_line_item/:id' => 'orders#minus_line_item', as: 'minus_line_item'
  post 'cart/plus_line_item/:id' => 'orders#plus_line_item', as: 'plus_line_item'
  post 'cart/delete_line_item/:id' => 'orders#delete_line_item', as: 'delete_line_item'
  post 'order/:id/update_comment' => 'order#update_comment', as: 'update_comment'

  get ':taxonomy' => 'taxons#index', constraints: { taxonomy: /publishers|designers/ }
  get ':taxonomy/:taxon/' => 'taxons#show', constraints: { taxonomy: /categories|publishers|designers/ }
  get ':taxonomy/:taxon/:subtaxon' => 'taxons#show', constraints: { taxonomy: /categories/ }
  get ':taxonomy/:brand/:category/(:subcategory)' => 'taxons#show_for_brands_and_categories',
        constraints: { taxonomy: /publishers|designers/ }, as: 'crosstaxons'

  match '/products/:scope' => 'products#index', constraints: { scope: /recommended|popular|sale/ }, as: 'products_with_scope'
  match '/products/tags/:tag' => 'products#tags', as: 'products_tags'

  resources :addresses

  scope :module => "gateway" do
    match '/robokassa/:gateway_id/:order_id' => 'robokassa#show',    :as => :robokassa
    match '/robokassa/result'                => 'robokassa#result',  :as => :robokassa_result
    match '/robokassa/success'               => 'robokassa#success', :as => :robokassa_success
    match '/robokassa/fail'                  => 'robokassa#fail',    :as => :robokassa_fail
  end

  namespace :admin do
    match '/products/:id/new_tag_id' => 'tags#new_product_tag_id', as: 'new_product_tag_id'
    match 'products/publish' => 'products#publish', as: 'publish_product'

    resources :banners

    resources :products do 
      resources :tags
    end
  end
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

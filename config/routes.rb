Grab::Application.routes.draw do
  resources :post_ulos do
	post 'grab_ulo' => 'post_ulos#grab_ulo', on: :collection
	get 'clear_ulo' => 'post_ulos#clear_ulo', on: :collection
  end

  resources :post_ulo_busitrans do
	post 'grab_ulo_busitran' => 'post_ulo_busitrans#grab_ulo_busitran', on: :collection
  end

  resources :post_ulo_houesales do
	post 'grab_ulo_houesale' => 'post_ulo_houesales#grab_ulo_houesale', on: :collection
  end

  resources :post_ulo_housrents do
	post 'grab_ulo_housrent' => 'post_ulo_housrents#grab_ulo_housrent', on: :collection
  end

  resources :posts do
    post 'grab_dadi' => 'posts#grab_dadi', on: :collection
  end
  
  root 'application#home'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end

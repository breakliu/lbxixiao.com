DglbxxCom::Application.routes.draw do
  resources :ctypes do
    collection do
      get  :manage
      post :rebuild
    end
  end

  # resources :posts, only: [] do
  #   member do
  #     get :view
  #   end
  # end

  devise_for :users

  resources :categories do
    collection do
      get  :manage
      post :rebuild
    end

    resources :posts
  end

  namespace :admin do
    get 'index'
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  get "c/:category_id/:children_id" => 'home#page', as: 'page'
  get "topic/:category_id/:children_id" => 'home#topic', as: 'topic'
  get "topic_index" => 'home#topic_index', as: 'topic_index'
  get "post/:id" => 'posts#view', as: 'view_post'
  #get "c/:category_id/:children_id" => 'home#page', as: 'content'
  #get "home/index"
  root "home#index"

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

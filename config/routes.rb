Rails.application.routes.draw do
  get 'letters/index'

  get 'letters/new'

  get 'letters/edit'

  get 'letters/delete'

  get 'event_details/index'

  get 'profiles/index'

  root 'users#index'
  post '/users' => 'users#create'
  post '/users/update' => 'users#update'

  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'

  get '/event_details/show/:id' => 'event_details#show'
  get '/events' => 'events#index'
  post '/events' => 'events#create'
  post '/events/edit/:id' => 'events#edit'
  delete '/events/:id' => 'events#destroy'

  get '/joins/:id' => 'joins#create'
  delete '/joins/:id' => 'joins#destroy'

  get '/profiles/:id' => 'profiles#edit'

  post '/profiles/:id' => 'profiles#edit'

  get '/profiles/edit/:id' => 'profiles#edit'

  post '/profiles/edit/:id' => 'profiles#edit'

  get '/events/:id' => 'event_details#index'

  post '/comments' => 'comments#create'

  post '/letters/new/:id' => 'letters#create'

  get '/letters/:id' => 'letters#index'

  patch '/users/:id' => 'users#update'

  patch '/profiles/:id' => 'users#update'

  post '/profiles/index' => 'users#update'

  get '/notice/:id'  => 'users#update'

  resources :users

 


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

Bilty::Application.routes.draw do
  
  get "dashboards/index"
  devise_for :users 
  
  authenticated :user do
    root :to => "dashboards#index"
  end
  
  unauthenticated :user do
    devise_scope :user do
      get "/" => "devise/sessions#new"
    end
  end
   
  resources :invoices do
    get :autocomplete_indian_city_city_name, :on => :collection
  end
  resources :users do
    member do
      get :update_user_to_active
    end
  end
  resources :customs
  resources :expenses
  resources :branches do
    member do
      get :get_cities
    end
  end
  resources :lr_entries do 
    get :change_branch_name
    member do
      match :update_delivery_details, :via => [:get, :put]
      match :upload_pod, :via => [:get, :post]
    end
  end
  resources :lorry_challans
  resources :searches do
    collection do
      match "search_by_location" => "searches#search_by_location", :via => [:get, :post]
      match "search_by_dates" => "searches#search_by_dates", :via => [:get, :post]
      match "search_by_bilty_no" => "searches#search_by_bilty_no", :via => [:get, :post]
    end
  end
  match 'upload_cities' => "invoices#upload_cities", :via => [:get, :post]
  match 'users/create' => "users#create",:as => :create_user, :via => [:post]
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

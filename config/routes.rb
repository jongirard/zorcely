Rails.application.routes.draw do
  devise_for :users, :path_names => { :sign_up => 'register' }, :controllers => { :registrations => "registrations", :sessions => 'devise/sessions'}, :skip => [:sessions]
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

  root 'high_voltage/pages#show', id: 'home'

  authenticated :user do
      resources :projects
      resources :organizations
      root :to => "projects#index", :as => "authenticated_root"
    end
    get "/organizations/" => "organizations#index", :as => :anon_organizations
    get "/organizations/:guid/" => "organizations#show", :as => :guid_organization

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
  devise_scope :user do
    get "/register", :to => "registrations#new"
    get "login" => "devise/sessions#new", :as => :new_user_session
    post 'login' => 'devise/sessions#create', :as => :user_session
    delete 'logout' => 'devise/sessions#destroy', :as => :destroy_user_session
    get "/passwordreset/new" => "devise/passwords#new", :as => :forgot_password
    get "/confirmation/new" => "devise/confirmations#new", :as => :new_confirmation
    get "users/billing" => "registrations#billing", :as => :user_billing
    get "users/account" => "accounts#edit", :as => :user_personal
    patch "users/account" => "accounts#update"
  end
end

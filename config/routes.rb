Salinger::Application.routes.draw do 
  post "versions/:id/revert" => "versions#revert", :as => "revert_version"
  resources :versions
  resources :order_statuses
  resources :address_types
  #resources :customer_addresses
  #match 'new_customer_address/:id' => 'customer_addresses#new', :as => :new_customer_address

  resources :tasks
  resources :emails
  resources :email_types
  resources :task_status_types

  match 'my_tasks' => 'tasks#my_tasks', :as => :my_tasks
  match 'customer_addresses' => 'customer_addresses#index', :as => :customer_addresses
  match 'new_purchase' => 'purchases#new', :as => :new_purchase
  match 'create_purchase' => 'purchases#create', :as => :create_purchase
  match 'email_signup' => 'home#email_signup', :as => :email_signup
 
  match 'orders' => 'orders#index', :as => :orders
  match 'new_note/:notable_id/:notable_type/:type' => 'notes#new', :as => :new_note

  resources :order_line_items
  resources :retailers
  resources :addresses
  resources :farms
  resources :notes
  resources :customers do
   resources :orders
   resources :customer_addresses
  end
  resources :fabrics
  resources :users
  resources :user_sessions
  resources :roles
  resources :products

  match 'payment' => 'products#new_payment', :as => :payment
  match 'process_payment' => 'products#process_payment', :as => :process_payment
  match 'hamlet' => 'home#hamlet', :as => :hamlet
  match 'login' => 'user_sessions#new', :as => :login
  match 'logout' => 'user_sessions#destroy', :as => :logout
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
  root :to => 'home#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end

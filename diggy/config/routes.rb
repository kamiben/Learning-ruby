#Shovell::Application.routes.draw do
 # get "users/show"

 # get "sessions/new"

 # get "sessions/create"

 # get "sessions/destroy"

 # get "votes/create"

#  get "stories/index"
#  get "stories/new"

ActionController::Routing::Routes.draw do |map| # Attention pas terrible pour rails3
 map.resources :users
 map.resources :stories, :has_many => :votes, :collection => {:bin=>:get} # Inclure des resources supplémentaires pour stories dans les routes, permet donc l'acces via url à : index (utilisé), new(utilisé), create (utilisé), show, edit, update, destroy
 # has_many permet quand à lui de lier la vue vote a la vue story, un vote ne sera maintenant accessible que via /story/vote et plus via /vote
 map.connect ':controller/:action/:id' # Attention pas top rail3
 map.connect ':controller/:action/:id.:format' #idem
 map.resource :session
 
 map.root :controller => "stories"

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
  # root :to => "stories"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end

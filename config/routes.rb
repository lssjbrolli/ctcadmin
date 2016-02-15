Ctcadmin::Application.routes.draw do

	resources :extern_expenses, :companies, :credit_invoices, :credit_notes, :national_expenses, :trip_expenses,
			  :employees, :payments

	post 'make_report', to: 'reports#make_report'

	get 'payment_report', to: 'employees#payment_report'

	get '/payments/:id/bonus', to: 'payments#bonus', as: :bonus

	get '/payments/:id/order', to: 'orders#new', as: :new_order

	resources :reports, only: :show
	resources :site_settings, only: [:index, :edit]

	resources :orders, only: [:show, :create]

	resources :employees do
		resources :payments
		resources :papers
	end

	resources :trucks do
		resources :events
		resources :papers
	end

	resources :users, except: :show

	resources :sessions, only: [:new, :create, :destroy]

	#get 'profile', to: 'users#show'

	# The priority is based upon order of creation: first created -> highest priority.
	# See how all your routes lay out with "rake routes".

	match '/signup', to: 'users#new', via: 'get'
	match '/signin', to: 'sessions#new', via: 'get'
	match '/signout', to: 'sessions#destroy', via: 'delete'
	match '/profile', to: 'users#show', via: 'get'

	# You can have the root of your site routed with "root"
	root 'trucks#index'

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	get '/trucks/:id/cnotes', to: 'trucks#cnotes', as: :cnotes

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

Rails.application.routes.draw do
  
 	get 'reviews/create'

  	devise_for :users
  	resources :movies
	root 'movies#index'

	get 'movies/:id/reviews' => 'reviews#create'



	namespace :admin do
		resources :users do
			put :upgrade 
			put :downgrade
		end
	end
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

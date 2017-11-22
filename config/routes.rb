Rails.application.routes.draw do
  
 	get 'reviews/create'

  	devise_for :users
  	resources :movies
	root 'movies#index'

	get 'movies/:id/reviews' => 'reviews#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

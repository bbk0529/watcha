Rails.application.routes.draw do
  
  resources :posts
 	get 'reviews/create'

  	devise_for :users
  	resources :movies
	root 'movies#index'

	get 'movies/:id/reviews' => 'reviews#create'



	namespace :admin do
		resources :users do
			put :upgrade#, on: :member # without on: :member, it should be :user_id
			put :downgrade#, on: :member
		end
	end
 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

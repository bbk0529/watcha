class ReviewsController < ApplicationController
	def create
  		Review.create(
  			movie_id: params[:id],
  			rating: params[:rating],
  			comment: params[:comment],
  			user_id: current_user.id
  		)
  		redirect_to movie_path(params[:id])
  end
end
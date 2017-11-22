class Admin::UsersController < Admin::ApplicationController
	def index
		@users = User.all
	end


	def destroy
		User.find(params[:id]).destroy 
		redirect_to admin_users_path
	end

	def upgrade
		@user=User.find(params[:user_id]) #since customized, :id -> :user_id
		@user.update(
			role: "admin"
		)
		redirect_to admin_users_path
	end 

	def downgrade
		@user=User.find(params[:user_id])
		@user.update(
			role: "regular"
		)
		redirect_to admin_users_path
	end 


end

class Admin::ApplicationController < ApplicationController #admin - namespace
	before_action :check_admin
	layout 'admin'


	private
		def check_admin
			unless user_signed_in? && current_user.admin?
				redirect_to root_path, alert: "Should login as admin"
			end 
		end 

end
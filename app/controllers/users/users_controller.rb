class Users::UsersController < ApplicationController
	before_action :authenticate_user!
	def show
			@user = User.find(params[:id])
	end

	def edit #edit password
		@user = current_user
	end

	def update_password
			@user = current_user
			if @user.update_with_password(user_params)
					bypass_sign_in(@user)
					redirect_to root_path
			else
					render "edit"
			end
	end

	def user_params
			params.require(:user).permit(:current_password, :password, :password_confirmation)
	end
end

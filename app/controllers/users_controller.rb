class UsersController < ApplicationController

	def show
		redirect_to root_path if params[:id].to_i != current_user.id
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:email] = @user.email
			redirect_to params[:user][:path]
		else
			redirect_to params[:user][:path], :notice => 'Oops, something went wrong...'
		end
	end

	def destroy
		
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
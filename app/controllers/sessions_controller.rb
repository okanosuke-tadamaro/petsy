class SessionsController < ApplicationController

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])
			session[:email] = @user.email
			redirect_to params[:path]
		else
			redirect_to params[:path], :notice => "Oops, something went wrong..."
		end
	end

	def destroy
		session[:email] = nil
		redirect_to root_path, :notice => 'Successfully signed out.'
	end

	def set_location
		if session[:zipcode] == nil
			zipcode = Geocoder.search("#{params[:location][:lat]},#{params[:location][:lon]}").first.data['address_components'].last['long_name']
			session[:zipcode] = zipcode
		end
		respond_to do |format|
			format.html
			format.json { render json: session[:zipcode].to_json }
		end
	end

end

class SessionsController < ApplicationController

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

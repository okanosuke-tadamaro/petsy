class LocationsController < ApplicationController

	def set_location
		if params[:zipcode].size == 5
			zipcode = params[:zipcode]
			session[:zipcode] = zipcode
			redirect_to search_path
		else
			redirect_to search_path, :notice => "The location information provided seems to be invalid..."
		end
	end

end
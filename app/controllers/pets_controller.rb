class PetsController < ApplicationController

	def index
		@pets = Pet.all
		# if session[:zipcode]
		# 	location_status = Location.exists?(zipcode: session[:zipcode])
		# 	if location_status && current_location.updated_at > Date.today - 2.days
		# 		location = Location.find_by(zipcode: session[:zipcode])
		# 		@pets = location.pets
		# 	elsif location_status
		# 		location = Location.find_by(zipcode: session[:zipcode])
		# 		Pet.get_pets(location)
		# 		@pets = location.pets
		# 	else
		# 		new_location = Location.create(zipcode: session[:zipcode])
		# 		Pet.get_pets(new_location)
		# 		@pets = new_location.pets
		# 	end
		# else

		# end
	end

	def show
		@pet = Pet.find(params[:id])
	end

end
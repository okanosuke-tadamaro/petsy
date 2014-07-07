class PetsController < ApplicationController

	def index
		@pets = Pet.all.sample(20)
	end

	def location
		if session[:zipcode]
			location_status = Location.exists?(zipcode: session[:zipcode])
			if location_status && current_location.updated_at > Date.today - 2.days
				location = Location.find_by(zipcode: session[:zipcode])
				@pets = location.pets
			elsif location_status
				location = Location.find_by(zipcode: session[:zipcode])
				Pet.get_pets(location)
				@pets = location.pets
			else
				new_location = Location.create(zipcode: session[:zipcode])
				Pet.get_pets(new_location)
				@pets = new_location.pets
			end
		else
			@pets = Pet.all
		end

		respond_to do |format|
			format.html { render template: 'pets/index' }
		end
	end

	def show
		@pet = Pet.find(params[:id])
	end

	def match

	end

end

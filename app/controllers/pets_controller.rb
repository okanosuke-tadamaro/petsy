class PetsController < ApplicationController

	def index
		@pets = Pet.get_pets
	end

end
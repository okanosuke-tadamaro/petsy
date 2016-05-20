class PetsController < ApplicationController

	before_filter :ensure_recent_data

	def index
		@pets = Pet.all.limit(20).reverse
	end

	private

	def ensure_recent_data
		Pet.update_pets if Pet.out_of_date?
	end

end

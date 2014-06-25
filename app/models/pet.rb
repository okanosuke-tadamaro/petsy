class Pet < ActiveRecord::Base

	has_many :breeds
	has_many :photos

	@@url = 'http://api.petfinder.com/'

	def self.get_pets
		# response = Crack::XML.parse(RestClient.get(@@url + 'pet.find?key=' + ENV['PETFINDER_KEY'] + '&animal=dog&location=10502&output=basic'))
		# response["petfinder"]["pets"]["pet"].each do |pet|
		# 	if !Pet.exists?(pf_id: pet["id"])
		# 		pet = Pet.create(
		# 			pf_id: 				pet["id"],
		# 			shelter_id: 	pet["shelterId"],
		# 			type: 				pet["animal"],
		# 			name: 				pet["name"],
		# 			age: 					pet["age"],
		# 			sex: 					pet["sex"],
		# 			size: 				pet["size"],
		# 			description: 	pet["description"],
		# 			last_update: 	pet["lastUpdate"]
		# 			)
		# 		pet["breeds"]["breed"].each { |breed| pet.breeds.create(breed: breed) if !Breed.exists?(breed: breed) }
		# 		pet["media"]["photos"]["photo"].each { |photo| pet.photos.create(url: photo) }
		# 	end
		# end
	end

end

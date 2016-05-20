class Pet < ActiveRecord::Base

	has_and_belongs_to_many :locations
	has_and_belongs_to_many :breeds
	has_and_belongs_to_many :options
	has_many :photos

	validates :pf_id, :shelter_id, :animal_type, :name, :age, :sex, :size, :last_update, presence: true

	@@petfinder_url = 'http://api.petfinder.com/'

	def self.out_of_date?

	end

	def self.update_pets
		binding.pry
	end

	def self.api_request(location)
		begin
			response = Crack::XML.parse(RestClient.get(@@petfinder_url + 'pet.find?key=' + ENV['PETFINDER_KEY'] + '&location=' + location.zipcode.to_s + '&count=20&output=full'))
			if response["petfinder"]["header"]["status"]["code"] == "999"
				return []
			else
				return response
			end
		rescue
			return []
		end
	end

	def self.get_pets(location)
		response = Pet.api_request(location)
		if !response.empty?
			response["petfinder"]["pets"]["pet"].each do |pet|
				if !Pet.exists?(pf_id: pet["id"])
					new_pet = Pet.create(
						pf_id: 				pet["id"],
						shelter_id: 	pet["shelterId"],
						animal_type: 	pet["animal"],
						name: 				pet["name"],
						age: 					pet["age"],
						sex: 					pet["sex"],
						size: 				pet["size"],
						description: 	pet["description"],
						last_update: 	pet["lastUpdate"]
						)

					if pet["breeds"]["breed"].class != REXMLUtiliyNodeString
						pet["breeds"]["breed"].each do |breed|
							if Breed.exists?(breed: breed)
								new_breed = Breed.find_by(breed: breed)
							else
								new_breed = Breed.create(breed: breed.to_s)
							end
							new_pet.breeds << new_breed
						end
					else
						if Breed.exists?(breed: pet["breeds"]["breed"].to_s)
							new_breed = Breed.find_by(breed: pet["breeds"]["breed"].to_s)
						else
							new_breed = Breed.create(breed: pet["breeds"]["breed"].to_s)
						end
						new_pet.breeds << new_breed
					end

					if pet["media"] != nil
						pet["media"]["photos"]["photo"].each do |photo|
							photo_url = photo.to_s.gsub(/\?\w*\=/, '').gsub(/\&\w*=\d*\&-\w*/, '')
							new_pet.photos.create(url: photo_url) if !new_pet.photos.exists?(url: photo_url)
						end
					end

					if pet["options"] != nil
						if pet["options"]["option"].class != Array
							pet["options"]["option"] = [pet["options"]["option"]]
						end
						pet["options"]["option"].each do |option|
							if !Option.exists?(option: option)
								new_pet.options.create(option: option)
							else
								option_info = Option.find_by(option: option)
								new_pet.options << option_info
							end
						end
					end

				else
					new_pet = Pet.find_by(pf_id: pet["id"])
				end
				location.pets << new_pet if !location.pets.exists?(pf_id: pet["id"])
			end
		else
			return response
		end
	end

	def construct_return_data
		if self.photos.empty?
			photos = "http://www.placehold.it/300x300"
		else
			photos = self.photos.first.url
		end

		if self.breeds.empty?
			breeds = ["no breed info"]
		else
			breeds = self.breeds.map { |breed| breed.breed }
		end

		return {
			pf_id: self.pf_id,
			animal_type: self.animal_type,
			name: self.name,
			age: self.age,
			sex: self.sex,
			size: self.size,
			description: self.description,
			photo: photos,
			breed: breeds
		}
	end

end

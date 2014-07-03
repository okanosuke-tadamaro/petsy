require 'rails_helper'

describe Pet do

	describe '.api_request' do
		it 'returns an empty array when an invalid location is specified or request errors out' do
			location = Location.create(zipcode: 000000)
			expect(Pet.api_request(location)).to eq([])
		end
	end
	
end
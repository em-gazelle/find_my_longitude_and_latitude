require 'rails_helper'

RSpec.describe GeocodedLocation, type: :model do
	let(:absent_params) { Fabricate.build(:geocoded_location, address: nil) }
	let(:invalid_address) { Fabricate.build(:geocoded_location, address: "808080808080808080808080") }
	let(:valid_address) { Fabricate.build(:geocoded_location, address: "117A Bartlett St., San Francisco, CA") }

	describe 'validations' do
		it 'does not create a geocoded_location when user does not supply an address' do
			expect(absent_params).to_not be_valid 
		end
	end
	describe 'geocode_api_results_valid?' do
		context 'when valid address supplied' do
			it 'sets attributes from geocoded location: formatted/full address, longitude, and latitude' do
				expect(valid_address.longitude.nil?).to be false
				expect(valid_address.latitude.nil?).to be false
				expect(valid_address.save).to eq true				
			end
		end
		context 'when invalid address supplied and Geocode API returns no results' do
			it 'returns error of invalid address' do
				expect(invalid_address.save).to be false
			end
		end
	end
end
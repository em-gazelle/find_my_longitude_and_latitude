require 'rails_helper'

RSpec.describe GeocodedLocation, type: :model do
	let(:address) { Fabricate.build(:geocoded_location, address: nil) }
	describe 'validations' do
		it 'does not create an address when user does not supply an address' do
			expect(address).to_not be_valid 
		end
	end

end
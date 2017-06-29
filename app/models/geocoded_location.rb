class GeocodedLocation < ActiveRecord::Base
	validates_presence_of :address
	before_save :parsed_geocode_api_results_valid?

	private

	def geocode_api_results
        api_params = {address: self.address, key: Rails.application.secrets.geocode_api_key}
        google_geocode_url = "https://maps.googleapis.com/maps/api/geocode/json"
        HTTParty.post(google_geocode_url, query: api_params)
	end

	def parsed_geocode_api_results_valid?
		response = geocode_api_results.parsed_response["results"][0]
		if response.nil?
			errors.add(:address)
			false
		else
			set_attributes(response)
		end
	end

	def set_attributes(response)
        self.latitude = response["geometry"]["location"]["lat"]
        self.longitude = response["geometry"]["location"]["lng"]
        self.address = response["formatted_address"]
	end

end
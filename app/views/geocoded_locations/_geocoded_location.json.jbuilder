json.extract! geocoded_location, :id, :longitude, :latitude, :address, :created_at, :updated_at
json.url geocoded_location_url(geocoded_location, format: :json)

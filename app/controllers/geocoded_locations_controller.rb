class GeocodedLocationsController < ApplicationController
  before_action :set_geocoded_locations, only: [:new, :create]

  # GET /geocoded_locations/new
  def new
    @geocoded_location = GeocodedLocation.new
 end

  # POST /geocoded_locations
  # POST /geocoded_locations.json
  def create
    @geocoded_location = GeocodedLocation.new(geocoded_location_params)

    respond_to do |format|
      if @geocoded_location.save
        format.html { redirect_to :root, notice: 'Geocoded location was successfully created.' }
        format.json { render :show, status: :created, location: @geocoded_location }
      else
        format.html { render :new }
        format.json { render json: @geocoded_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /geocoded_locations/1
  # DELETE /geocoded_locations/1.json
  def destroy
    @geocoded_location = GeocodedLocation.find(params[:id])
    @geocoded_location.destroy

    respond_to do |format|
      format.html { redirect_to :root, notice: 'Geocoded location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_geocoded_locations
      @geocoded_locations = GeocodedLocation.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def geocoded_location_params
      params.require(:geocoded_location).permit(:address)
    end
end

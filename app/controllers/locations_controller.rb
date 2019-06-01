class LocationsController < ApplicationController
  before_action :set_trip
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  
  def index
    @locations = @trip.locations.all
  end

  def show
  end

  def new
    @location = @trip.locations.new
    render partial: "form"
  end

  def create
    @location = @trip.locations.new(location_params)

    if @location.save
      redirect_to trip_location_path(@trip.id, @location.id)
    else
      render partial: "form"
    end

  end

  def edit
    render partial: "form"
  end

  def update
    if @location.update(location_params)
      redirect_to trip_location_path(@trip, @location)
    else
      render partial: "form"
    end
  end

  def destroy
    @location.destroy
    redirect_to trip_locations_path(@trip)
  end

  private

    def set_trip
      @trip = Trip.find(params[:trip_id])
    end

    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :fee, :image)
    end

end

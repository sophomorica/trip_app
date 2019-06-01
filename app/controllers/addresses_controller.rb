class AddressesController < ApplicationController
before_action :set_location
before_action :set_address, only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @location.addresses
  end

  def show
  end

  def new
    @address = @location.addresses.new
  end

  def create
      @address = Address.new(address_params, @location.id)
      if @address.save
      redirect_to location_address_path(@location.trip_id, @location)
      else
        render :new
      end
  end

  def edit
  end

  def update
    if @address.update(address_params)
      redirect_to trip_location_path(@location.trip_id,@location)
    else
      render :edit
    end
  end

  def destroy
    @address.destroy
    redirect_to location_path
  end

  private

  def address_params
    params.require(:address).permit(:street, :city, :state, :lat, :long, :location_id)
  end

  def set_address
    @address = Address.find(params[:id])
  end

  def set_location
    @location = Location.find(params[:location_id])
  end
end

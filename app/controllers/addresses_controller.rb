class AddressesController < ApplicationController
before_action :set_location
before_action :set_address only: [:show, :edit, :update, :destroy]

  def index
    @addresses = @location.addresses
  end

  def show
  end

  def new
    @address = @location.address.new
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
      redirect_to trip_location_path(@location.trip_id,@list)
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
    @address = Board.find(params[:id])
  end

  def set_location
    @location = location.find(params[:location_id])
  end

  def set_trip
    @board = Board.find(@location.trip_id)
  end

end

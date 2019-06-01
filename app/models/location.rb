class Location < ApplicationRecord
  belongs_to :trip
  has_one :address, dependent: :destroy
end

# def self.get_spot()
#   @client = GooglePlaces::Client.new(AIzaSyDW72uDnvL5HWkdz47zH60dh8QhbBar_dA)
#   @client.spot('arches')
# end

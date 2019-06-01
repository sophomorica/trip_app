class Location < ApplicationRecord
  belongs_to :trip
  has_one :address, dependent: :destroy


def self.get_spot(searchString)
  @client = GooglePlaces::Client.new('AIzaSyDW72uDnvL5HWkdz47zH60dh8QhbBar_dA')
  @client.spots_by_query(searchString)
end

end
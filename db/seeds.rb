u = User.create(
  email: "test@test.com",
  password: "password",
  password_confirmation: "password"
)
  8.times do 
    trip = Trip.create(
      name: Faker::TvShows::StarTrek.specie,
      start_date: Faker::Date.between(2.days.ago, Date.today),
      end_date: Faker::Date.forward(3),
      user_id: u.id
    )
      2.times do 
      
      location = Location.create(
        name: Faker::Address.state,
        fees: "10 Dollars",
        image:Faker::Dessert.variety,
        trip_id: trip.id
  
      )
      
          Address.create(
  
            street:Faker::Address.street_address,
            city:Faker::Address.city,
            state:Faker::Address.state,
            lat:Faker::Address.latitude,
            long:Faker::Address.longitude,
            location_id: location.id
            )
    
  end
end

puts "Created User with 3 trips 2 locations per trip and 1 address per location "
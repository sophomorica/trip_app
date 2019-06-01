u = User.create(
  email: "test@test.com",
  password: "password",
  password_confirmation: "password"
)
3.times do 
  trip = Trip.create(
    name: Faker::TvShows::StarTrek.location,
    start_date: Faker::Date.between(2.days.ago, Date.today),
    end_date: Faker::Date.forward(3)
    user_id: u.id
  )
  2.times do 
    Location.create(
      name: Faker::Address.state,
      fees: ,
      image:,
      trip_id: trip.id

    )
    2.times do
      street:Faker::Address.street_address,
      city:Faker::Address.city,
      state:Faker::Address.state,
      lat:Faker::Address.latitude,
      long:Faker::Address.longitude,
      location_id: location.id
    end
    
  end
end
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
    trip_id: u.id
  )
  2.times do 
    Location.create(
      name: Faker::,
      fees: ,
      image:,

    )
    
  end
end
10.times do |i|
  User.create(
    email: Faker::Email.email,
    firstname: Faker::Name.first_name,
    lastname: Faker::Name.last_name,
    password: 'password'
  )
end

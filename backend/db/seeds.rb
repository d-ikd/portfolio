User.create!(
  name: ENV['RAILS_ADMIN_USER'],
  email: ENV['RAILS_ADMIN_ADDRESS'],
  password: ENV['RAILS_ADMIN_KEY'],
  password_confirmation: ENV['RAILS_ADMIN_KEY'],
  admin: true
)

User.create!(
  name: ENV['RAILS_GUEST_USER'],
  email: ENV['RAILS_GUEST_ADDRESS'],
  password: ENV['RAILS_GUEST_KEY'],
  password_confirmation: ENV['RAILS_GUEST_KEY'],
  admin: false
)

19.times do |n|
  name  = Faker::Name.name
  email = "example-#{n + 1}@tester.com"
  password = 'password'
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password
  )
end

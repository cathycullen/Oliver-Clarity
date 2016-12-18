User.create!(name: "Seed User", email: "seeduser@oliverclarity.com", password: "foobar", password_confirmation: "foobar")

50.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@oliverclarity.com"
    password = "password"
    User.create!(name: name, email: email, password: password, password_confirmation: password)
end


User.delete_all
User.create!(name: "Seed User", email: "seeduser@oliverclarity.com", password: "foobar", password_confirmation: "foobar", role: 'admin')

50.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@oliverclarity.com"
    password = "password"
    User.create!(name: name, email: email, password: password, password_confirmation: password)
end

states = ['IL', 'NY', 'CA', 'MA', 'FL', 'TX', 'NJ', 'PA', 'CT', 'WA', 'LV', 'DE']
atty_arr = []

Attorney.delete_all
5.times do |n|
  atty_name = Faker::Name.first_name + " " + Faker::Name.last_name
  atty_email = atty_name.downcase.gsub!(/ /, '.')+"@lawyer.com"
  atty_phone = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address + ", " + Faker::Address.city + ", "+ Faker::Address.state + ", " + Faker::Address.zip_code
  #puts "atty_name #{atty_name} atty_email #{atty_email} atty_phone #{atty_phone} address #{address}"
  atty_arr.push(Attorney.create!(name: atty_name,
                                  email: atty_email,
                                  phone: atty_phone,
                                  states: states.sample,
                                  address: address,
                                  practice: "practice",
                                  license: "license"))
end

Budget.delete_all
Todo.delete_all

10.times do |n|
    name = Faker::Name.first_name + " " + Faker::Name.last_name
    email = name.downcase.gsub!(/ /, '.')+"@gmail.com"
    password = "password"
    #puts "user #{name} email #{email}"
    user = User.create!(name: name, email: email, password: password, password_confirmation: password, role: 'user')
    budget = Budget.create!(annual_amount: rand(100000..1000000), user_id: user.id)
    atty = atty_arr.sample
    UsersAttorney.create!(user_id: user.id, attorney_id: atty.id)
    todo = Todo.create!(item: 'ToDo 1', user_id: user.id)
    todo = Todo.create!(item: 'ToDo 2', user_id: user.id)
    todo = Todo.create!(item: 'ToDo 3', user_id: user.id)
end

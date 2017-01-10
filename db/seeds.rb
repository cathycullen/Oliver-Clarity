
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#

User.delete_all
User.create!(name: "Seed User", email: "seeduser@oliverclarity.com", activated: true, password: "foobar", password_confirmation: "foobar", role: 'admin')

user = User.create!(name: 'Trippe Fried', email: 'trippe@sourcedgeneralcounsel.com', activated: true, password: 'trippefried', password_confirmation: 'trippefried', role: 'admin')
user = User.create!(name: 'cathy cullen', email: 'cathy@softwareoptions.com', activated: true, password: 'cullen11', password_confirmation: 'cullen11', role: 'admin')

states = ['IL', 'NY', 'CA', 'MA', 'FL', 'TX', 'NJ', 'PA', 'CT', 'WA', 'NV', 'DE']
atty_arr = []
Attorney.delete_all
5.times do |n|
  atty_name = Faker::Name.first_name + " " + Faker::Name.last_name
  atty_email = atty_name.downcase.gsub!(/ /, '.').gsub("'", '')+"@lawyer.com"

  atty_phone = Faker::PhoneNumber.phone_number
  address = Faker::Address.street_address + ", " + Faker::Address.city + ", "+ Faker::Address.state + ", " + Faker::Address.zip_code  #puts "atty_name #{atty_name} atty_email #{atty_email} atty_phone #{atty_phone} address #{address}"
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
Mark.delete_all
Corp.delete_all
Expense.delete_all
Fee.delete_all

addresses = []
addresses << " PO BOX 101, Culver City, CA, 90230"
addresses << " PO BOX 102, Boston, MA, 01850"
addresses << " PO BOX 103, New York, NY, 10006"
addresses << " PO BOX 104, Chicago, IL, 60640"
companies = ["ABC Corp", "TestCo LLC", "FCG Inc"]
businesses = ["Marketing", "Technology", "Consulting", "Legal", "Retail", "Food Services", "Beverages"]
eins = ["38-3679495", "38-3689977", "38-3779853"]
colors = ["red", "black", "blue"]
registrations = ["2,773,556", "2,943,671", "2,897,057"]
rates = [150.0, 450.0, 250.0, 600.0, 125.0]
hours = [2.5, 10, 8, 20, 5.5, 40, 12.25]

10.times do |n|
    name = Faker::Name.first_name + " " + Faker::Name.last_name
    email = name.downcase.gsub!(/ /, '.').gsub("'", '')+"@gmail.com"
    password = "password"
    puts "create user #{name} email #{email}"
    user = User.create!(name: name, email: email, activated: true, password: password, password_confirmation: password, role: 'user')
    budget = Budget.create!(annual_amount: rand(100000..1000000), user_id: user.id)
    atty = atty_arr.sample
    UsersAttorney.create!(user_id: user.id, attorney_id: atty.id)
    todo = Todo.create!(item: 'ToDo 1', user_id: user.id)
    todo = Todo.create!(item: 'ToDo 2', user_id: user.id)
    todo = Todo.create!(item: 'ToDo 3', user_id: user.id)


    3.times do |i|
      contact = Faker::Name.first_name + " " + Faker::Name.last_name
      contact_email = contact.downcase.gsub!(/ /, '.')+"@gmail.com"
      owners = Faker::Name.first_name + " " + Faker::Name.last_name
      office = addresses.sample
      business = businesses.sample
      corp = Corp.create!(user_id: user.id,
                          contact: contact,
                          email: contact_email,
                          owners: user.name + " 100%",
                          office: office,
                          state: office.split(", ")[2],
                          company: companies[i],
                          business: business,
                          regagent: atty_arr.sample.name,
                          regoffice: "Reg Office",
                          incorporation: companies[i].split(" ")[1],
                          ein: eins[i],
                          next: Date.today+(100*rand())
                          )
        mark = Mark.create!(user_id: user.id,
                            contact: contact,
                            email: contact_email,
                            owner: user.name,
                            entity: "entity",
                            address: corp.office,
                            description: "This trademark describes...",
                            colors: colors.sample,
                            anywhere: "yes",
                            commerce: "commerce",
                            products: business,
                            serial: "123456",
                            registration: registrations.sample,
                            next: Date.today+(100*rand()),
                            deadline: Date.today+(100*rand()),
        )

        expense = Expense.create!(user_id: user.id,
                                  date: Date.today-(500*rand()),
                                  vendor: "vendor name",
                                  amount: (rand() * 3000).round(2)
        )
        rate = rates.sample
        how_long = hours.sample
        charge = rate * how_long
        fee = Fee.create!(user_id: user.id,
                          date: Date.today-(500*rand()),
                          rate: rate,
                          hours: how_long,
                          charge: charge
        )
    end

end

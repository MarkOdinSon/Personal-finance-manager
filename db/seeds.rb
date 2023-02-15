require 'faker'

# This is not related to categories but I need to add a lot of entries to demonstrate search and pagination

Category.create!([{
                    name: 'Vehicle (Fuel)',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Vehicle (Service)',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Medications',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Massage',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Shoes',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Restaurants',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Payment of bills',
                    description: "Light (power, electricity), gas, water"
                  },
                  {
                    name: 'Internet',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Mobile operator services',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Household goods',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Nutrition (food)',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Gifts',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Subway pass',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Computer games',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  },
                  {
                    name: 'Drinking water',
                    description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}"
                  }])

puts "Created #{Category.count} Categories"

130.times do
  begin
    Operation.create!([{
                        amount: rand(50.0...10000.0).round(2),
                        odate: Faker::Date.between(from: '2019-01-01', to: '2023-01-01'),
                        description: "Here same description: #{Faker::Alphanumeric.alpha(number: 10)}",
                        category: Category.offset(rand(Category.count)).first
                      }
                     ])
  rescue
  end
end

puts "Created #{Operation.count} Operations"

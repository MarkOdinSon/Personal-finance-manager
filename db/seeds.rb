require 'faker'

# This is not related to categories but I need to add a lot of entries to demonstrate search and pagination

50.times do
  begin
    Category.create!([{
                        name: Faker::Food.dish,
                        description: Faker::Alphanumeric.alpha(number: 10)
                      }
                     ])
  rescue

  end

end

50.times do
  begin
    Category.create!([{
                        name: Faker::Tea.variety,
                        description: Faker::Alphanumeric.alpha(number: 10)
                      }
                     ])
  rescue

  end

end

100.times do
  begin
    Category.create!([{
                        name: Faker::Dessert.variety,
                        description: Faker::Alphanumeric.alpha(number: 10)
                      }
                     ])
  rescue

  end

end

puts "Created #{Category.count} Categories"

100.times do
  begin
    Operation.create!([{
                        amount: rand(5.0...10000.0).round(2),
                        odate: Faker::Date.between(from: '2019-06-01', to: '2023-01-01'),
                        description: Faker::Alphanumeric.alpha(number: 10),
                        category: Category.offset(rand(Category.count)).first
                      }
                     ])
  rescue

  end

end

puts "Created #{Operation.count} Operations"

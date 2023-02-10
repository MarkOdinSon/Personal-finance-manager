require 'faker'

# This is not related to categories but I need to add a lot of entries to demonstrate search and pagination

50.times do
  begin
    Category.create!([{
                        name: Faker::Food.dish,
                        description: 'Some category description ...'
                      }
                     ])
  rescue

  end

end

50.times do
  begin
    Category.create!([{
                        name: Faker::Tea.variety,
                        description: 'Some category description ...'
                      }
                     ])
  rescue

  end

end

50.times do
  begin
    Category.create!([{
                        name: Faker::Dessert.variety,
                        description: 'Some category description ...'
                      }
                     ])
  rescue

  end

end

50.times do
  begin
    Category.create!([{
                        name: Faker::Coffee.blend_name,
                        description: 'Some category description ...'
                      }
                     ])
  rescue

  end

end

puts "Created #{Category.count} Categories"

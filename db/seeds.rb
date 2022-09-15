# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# 5.times do
#   Customer.create!(
#       first_name { Faker::Name.first_name }
#       last_name { Faker::Name.last_name }
#       email { "#{first_name}.#{last_name}@email.com" }
#       address { Faker::Address.full_address }
#   )
# end

# 5.times do
#   Tea.create!(
#       title { Faker::Tea.variety }
#       description { Faker::Tea.type }
#       temperature { Faker::Number.within(range: 98..102) }
#       brew_time { Faker::Number.within(range: 5..7) }
#   )
# end

Subscription.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('subscriptions')
Tea.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('teas')
Customer.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!('customers')

customer = Customer.create!(first_name: 'Becks', last_name: 'yo', email: 'becks@test.com', address: 'aqui denver, co')

tea1 = Tea.create!(title: 'Mint Tea', description: 'bad', temperature: 120, brew_time: 8)
tea2 = Tea.create!(title: 'Chai Tea', description: 'very good', temperature: 178, brew_time: 10)

subscription  = customer.subscriptions.create!(title: "Becks tea selection", price: 9.89, status: 0, frequency: 0, tea_id: tea1.id)
subscription2 = customer.subscriptions.create!(title: "Becks tea selection", price: 9.89, status: 1, frequency: 1, tea_id: tea2.id)

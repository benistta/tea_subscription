require 'rails_helper'

RSpec.describe 'customers subscriptions' do

  it 'list of subscriptions' do
    customer = Customer.create!(first_name: 'Becks', last_name: 'Yo', email: 'becks@test.com', address: 'aqui denver, co')
    tea1 = Tea.create!(title: 'Chai', description: 'So good', temperature: 123, brew_time: 10)
    tea2 = Tea.create!(title: 'Mint', description: 'mmm ok', temperature: 132, brew_time: 9)
    customer.subscriptions.create!( tea_id: tea1.id, title: 'Becks tea subscriptions', price: 8.8, frequency: 1, status: 0)
    customer.subscriptions.create!( tea_id: tea2.id, title: 'Becks tea subscriptions', price: 9.99, frequency: 1, status: 1)

    get "/api/v1/customers/#{customer.id}/subscriptions"

    response_body = JSON.parse(response.body, symbolize_names: true)
    subs = response_body[:data]

    expect(response).to be_successful
    expect(response).to have_http_status 200

    expect(response_body).to have_key :data
    expect(subs).to be_an Array
    expect(subs.count).to eq 2
  end

  it 'can add a customer to a tea subscription' do
    customer = Customer.create!(first_name: 'Becks', last_name: 'Yo', email: 'becks@test.com', address: 'aqui denver, co')
    tea1 = Tea.create!(title: 'Chai', description: 'So good', temperature: 123, brew_time: 10)
    tea2 = Tea.create!(title: 'Mint', description: 'mmm ok', temperature: 132, brew_time: 9)
    customer.subscriptions.create!( tea_id: tea1.id, title: 'Becks tea subscriptions', price: 8.8, frequency: 1, status: 0)
    customer.subscriptions.create!( tea_id: tea2.id, title: 'Becks tea subscriptions', price: 9.99, frequency: 1, status: 1)
      body = {
        tea_id: tea1.id,
        title: tea1.title,
        price: 6.90,
        status: :active,
        frequency: :monthly
      }

      post api_v1_customer_subscriptions_path(customer), params: body

      subscription = JSON.parse(response.body, symbolize_names: true)

      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(subscription).to be_a(Hash)
      expect(subscription).to have_key(:data)
      expect(subscription[:data]).to have_key(:id)

      expect(subscription[:data]).to have_key(:type)
      expect(subscription[:data][:type]).to eq("subscription")

      expect(subscription[:data]).to have_key(:attributes)
      expect(subscription[:data][:attributes]).to be_a(Hash)

      expect(subscription[:data][:attributes]).to have_key(:title)
      expect(subscription[:data][:attributes][:title]).to be_a(String)

      expect(subscription[:data][:attributes]).to have_key(:price)
      expect(subscription[:data][:attributes][:price]).to be_a(Float)

      expect(subscription[:data][:attributes]).to have_key(:status)
      expect(subscription[:data][:attributes][:status]).to be_a(String)

      expect(subscription[:data][:attributes]).to have_key(:frequency)
      expect(subscription[:data][:attributes][:frequency]).to be_a(String)
    end

    it 'does not create a subscription if fields are not properly filled' do
      customer = Customer.create!(first_name: 'Becks', last_name: 'Yo', email: 'becks@test.com', address: 'aqui denver, co')
      tea1 = Tea.create!(title: 'Chai', description: 'So good', temperature: 123, brew_time: 10)
      tea2 = Tea.create!(title: 'Mint', description: 'mmm ok', temperature: 132, brew_time: 9)
      customer.subscriptions.create!( tea_id: tea1.id, title: 'Becks tea subscriptions', price: 8.8, frequency: 1, status: 0)
      customer.subscriptions.create!( tea_id: tea2.id, title: 'Becks tea subscriptions', price: 9.99, frequency: 1, status: 1)
      body = {
        customer_id: customer.id,
        tea_id: tea1.id,
        title: tea1.title,
        price: 'string',
        status: :active,
        frequency: :annually
      }

      post api_v1_customer_subscriptions_path(customer), params: body.to_json

      expect(response).to have_http_status(400)
      expect(JSON.parse(response.body)["error"]).to eq("Sorry. Cannot create subscription")
    end

    it 'cancels a subscriptions' do
      customer = Customer.create!(first_name: 'Becks', last_name: 'Yo', email: 'becks@test.com', address: 'aqui denver, co')
      tea1 = Tea.create!(title: 'Chai', description: 'So good', temperature: 123, brew_time: 10)
      tea2 = Tea.create!(title: 'Mint', description: 'mmm ok', temperature: 132, brew_time: 9)
      subscription = customer.subscriptions.create!( tea_id: tea1.id, title: 'Becks tea subscriptions', price: 4, frequency: 1, status: 1)

      expect(subscription.status).to eq('active')

      patch "/api/v1/customers/#{customer.id}/subscriptions/#{subscription.id}/cancel"

      response_body = JSON.parse(response.body, symbolize_names: true)
      subscripcion = response_body[:data]
      expect(response).to be_successful
      expect(response).to have_http_status 200

      expect(response_body).to have_key :data
      expect(subscripcion).to be_a Hash
      expect(subscripcion.count).to eq 3
      expect(subscripcion[:attributes][:status]).to eq('cancelled')
  end
end

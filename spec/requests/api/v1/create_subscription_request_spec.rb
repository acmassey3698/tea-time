require 'rails_helper'

RSpec.describe 'Create a new subscription' do
  describe 'happy path' do
    it 'successfully creates a new subscription' do
      create_list(:customer, 3)
      create_list(:tea, 5)

      customer_email = Customer.first.email
      tea_name = Tea.first.name

      post '/api/v1/subscriptions', params: {
        customer_email: customer_email,
        tea_name: tea_name,
        frequency: "monthly"
      }

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)
      subscription = response_body[:data]

      expect(subscription[:id]).to eq(Subscription.last.id)
      expect(subscription[:type]).to eq("subscription")
      expect(subscription[:attributes][:customer_email]).to eq(customer_email)
      expect(subscription[:attributes][:tea_name]).to eq(tea_name)
      expect(subscription[:attributes][:price]).to eq(10.0)
      expect(subscription[:attributes][:status]).to eq("active")
      expect(subscription[:attributes][:frequency]).to eq("monthly")
    end
  end

  describe 'sad path/edge case' do
    it 'does not create a subscription if the input does not match a customer email' do
      create_list(:customer, 3)
      create_list(:tea, 5)

      customer_email = 'fnoawonoenr'
      tea_name = Tea.first.name

      post '/api/v1/subscriptions', params: {
        customer_email: customer_email,
        tea_name: tea_name,
        frequency: "monthly"
      }

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:errors].first).to eq("Customer must exist")
    end

    it 'does not create a subscription if the input does not match a tea name' do
      create_list(:customer, 3)
      create_list(:tea, 5)

      customer_email = Customer.first.email
      tea_name = 'nownonweorn'

      post '/api/v1/subscriptions', params: {
        customer_email: customer_email,
        tea_name: tea_name,
        frequency: "monthly"
      }

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:errors].first).to eq("Tea must exist")
    end

    it 'does not create a subscription when the frequency is omitted' do
      create_list(:customer, 3)
      create_list(:tea, 5)

      customer_email = Customer.first.email
      tea_name = Tea.first.name

      post '/api/v1/subscriptions', params: {
        customer_email: customer_email,
        tea_name: tea_name
      }

      expect(response).to_not be_successful
      expect(response.status).to eq(422)

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:errors].first).to eq("Frequency can't be blank")
    end
  end
end

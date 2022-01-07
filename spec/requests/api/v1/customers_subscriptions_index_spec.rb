require 'rails_helper'

RSpec.describe 'customer subs endpoint' do
  describe 'happy path' do
    it 'lists all of the subscriptions for a customer' do
      customers = create_list(:customer, 3)
      teas = create_list(:tea, 5)
      sub1 = Subscription.create!(
        customer: customers.first,
        tea: teas.first,
        frequency: "monthly"
      )
      sub2 = Subscription.create!(
        customer:customers.first,
        tea: teas.last,
        frequency: "yearly",
        status: "cancelled"
      )

      get "/api/v1/customers/#{Customer.first.id}/subscriptions"

      expect(response).to be_successful

      subscriptions = JSON.parse(response.body, symbolize_names: true)

      subscriptions[:data].each do |s|
        expect(s[:id]).to be_an Integer
        expect(s[:type]).to eq("subscription")
        expect(s[:attributes][:price]).to be_a Numeric
        expect(s[:attributes][:status]).to be_a String
        expect(s[:attributes][:frequency]).to be_a String
        expect(s[:attributes][:tea_id]).to be_a Integer
        expect(s[:attributes][:tea_id]).to be_a Integer
      end
    end
  end

  describe 'sad path/edge case' do
    it 'returns an error if no customer matches the given ID' do
      create_list(:customer, 3)

      get "/api/v1/customers/1/subscriptions"

      expect(response).to_not be_successful

      errors = JSON.parse(response.body, symbolize_names: true)

      expect(errors[:errors]).to eq("Couldn't find Customer with 'id'=1")
    end
  end
end

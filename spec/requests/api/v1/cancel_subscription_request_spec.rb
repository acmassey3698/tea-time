require 'rails_helper'

RSpec.describe 'cancel subscription endpoint' do
  describe 'happy path' do
    it 'successfully changes the status of a subscription' do
      customers = create_list(:customer, 5)
      teas = create_list(:tea, 5)
      sub1 = Subscription.create!(
        customer: customers.first,
        tea: teas.first,
        frequency: "monthly"
      )

      patch "/api/v1/subscriptions/#{sub1.id}", params: { status: "cancelled" }

      expect(response).to be_successful

      response_body = JSON.parse(response.body, symbolize_names: true)

      expect(response_body[:data][:id]).to eq(sub1.id)
      expect(response_body[:data][:attributes][:status]).to eq("cancelled")
    end
  end

  describe 'sad path/edge case' do

  end
end

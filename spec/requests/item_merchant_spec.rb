require 'rails_helper'

RSpec.describe "Item merchant api" do
  context "GET api/v1/items/:id/merchant" do
    it 'returns a collection of merchant' do
      Merchant.create(id: 1, name: "Henry's")
      Item.create(id: 1, name: "TV", merchant_id: 1)

      get "/api/v1/items/1/merchant"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      merchant_name = body['name']
      expect(merchant_name).to eq("Henry's")
    end
  end
end


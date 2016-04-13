require 'rails_helper'

RSpec.describe "Invoice merchant API" do
  context "GET api/v1/invoice/:id/merchant" do
    it "returns merchant for invoice" do
      Merchant.create(id: 4, name: "Henry's")
      invoice1 = Invoice.create(id: 1, merchant_id: 4)

      get "/api/v1/invoices/1/merchant"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['id']).to eq(4)
      expect(body['name']).to eq("Henry's")
    end
  end
end


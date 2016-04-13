require 'rails_helper'

RSpec.describe "Merchant invoices API" do
  context "GET api/v1/merchant/:id/invoices" do
    it "returns all the invoices for merchant" do
      merchant1 = Merchant.create(id: 1, name: 'Merchant1')
      Invoice.create(id: 1, merchant_id: merchant1.id)
      Invoice.create(id: 2, merchant_id: merchant1.id)

      get "/api/v1/merchants/1/invoices"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      merchant_names = body.map { |m| m["id"] }

      expect(merchant_names).to match_array([1, 2])
    end
  end
end



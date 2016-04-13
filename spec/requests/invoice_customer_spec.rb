require 'rails_helper'

RSpec.describe "Invoice customer API" do
  context "GET api/v1/invoice/:id/customer" do
    it "returns customer for invoice" do
      Customer.create(id: 4, first_name: "Henry")
      invoice1 = Invoice.create(id: 1, customer_id: 4)

      get "/api/v1/invoices/1/customer"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['id']).to eq(4)
      expect(body['first_name']).to eq("Henry")
    end
  end
end



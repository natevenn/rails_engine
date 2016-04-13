require 'rails_helper'

RSpec.describe "Customer invoices API" do
  context "GET api/v1/customer/:id/invoices" do
    it "returns all the invoices for customer" do
      customer1 = Customer.create(id: 1, first_name: 'Customer')
      Invoice.create(id: 1, customer_id: customer1.id)
      Invoice.create(id: 2, customer_id: customer1.id)

      get "/api/v1/customers/1/invoices"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      customer_ids = body.map { |m| m["id"] }

      expect(customer_ids).to match_array([1, 2])
    end
  end
end




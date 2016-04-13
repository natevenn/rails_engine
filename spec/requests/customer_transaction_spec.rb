require 'rails_helper'

RSpec.describe "Customer transactions API" do
  context "GET api/v1/customer/:id/transactions" do
    it "returns all the transactions for customer" do
      customer1 = Customer.create(id: 1, first_name: 'Customer')
      invoice1 = Invoice.create(id: 1, customer_id: customer1.id)
      invoice2 = Invoice.create(id: 2, customer_id: customer1.id)
      Transaction.create(id: 3, invoice_id: invoice1.id)
      Transaction.create(id: 4, invoice_id: invoice2.id)

      get "/api/v1/customers/1/transactions"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      transaction_id = body.map { |m| m["id"] }

      expect(transaction_id).to match_array([3, 4])
    end
  end
end


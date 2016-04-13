require 'rails_helper'

RSpec.describe "Transaction invoice API" do
  context "GET api/v1/transaction/:id/transactions" do
    it "returns all the invoices for transaction" do
      invoice1 = Invoice.create(id: 1, status: "pending")
      Transaction.create(id: 4, invoice_id: invoice1.id)

      get "/api/v1/transactions/4/invoice"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['id']).to eq(1)
    end
  end
end



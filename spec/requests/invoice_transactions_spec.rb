require 'rails_helper'

RSpec.describe "Invoice transaction API" do
  context '/api/v1/invoices/:id/transactions' do
    it 'returns a collection of transactions for invoice' do
      Invoice.create(id: 1, status: 'pending')
      Transaction.create(id: 4, invoice_id: 1)
      Transaction.create(id: 5, invoice_id: 1)
      Transaction.create(id: 8, invoice_id: 1)

      get '/api/v1/invoices/1/transactions'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      transaction_ids = body.map do |b|
        b['id']
      end

      expect(transaction_ids).to match_array [4, 5, 8]
    end
  end
end

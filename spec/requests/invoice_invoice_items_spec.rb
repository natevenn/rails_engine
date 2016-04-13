require 'rails_helper'

RSpec.describe "Invoice invoice_item API" do
  context "api/v1/invoices/:id/invoice_items" do
    it 'returns all invoice_items for invoice' do
      Invoice.create(id: 1, status: "pending")
      InvoiceItem.create(id: 2, invoice_id: 1)
      InvoiceItem.create(id: 3, invoice_id: 1)
      InvoiceItem.create(id: 4, invoice_id: 1)

      get '/api/v1/invoices/1/invoice_items'

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      invoice_item_ids = body.map do |b|
        b['id']
      end
      expect(invoice_item_ids).to match_array [2, 3, 4]
    end
  end
end

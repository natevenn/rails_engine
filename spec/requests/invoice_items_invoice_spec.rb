require 'rails_helper'

RSpec.describe "InvoiceItems invoice API" do
  context "GET api/v1/invoice_item/:id/invoices" do
    it "returns all the invoices for invoice_item" do
      invoice1 = Invoice.create(id: 1, status: "pending")
      InvoiceItem.create(id: 4, invoice_id: invoice1.id)

      get "/api/v1/invoice_items/4/invoice"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['id']).to eq(1)
    end
  end
end



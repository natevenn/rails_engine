require 'rails_helper'

RSpec.describe "Invoice items API" do
  context "GET api/v1/invoice/:id/items" do
    it "returns items for invoice" do
      Item.create(id: 4, name: "Henry's")
      Item.create(id: 3, name: "TV")
      Item.create(id: 5, name: "skateboard")
      Invoice.create(id: 1, status: "pending")
      InvoiceItem.create(id: 1, invoice_id: 1, item_id: 4)
      InvoiceItem.create(id: 2, invoice_id: 1, item_id: 3)
      InvoiceItem.create(id: 3, invoice_id: 1, item_id: 5)

      get "/api/v1/invoices/1/items"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      item_names = body.map do |b|
        b['name']
      end

      expect(item_names).to match_array(["Henry's", "TV", "skateboard"])
    end
  end
end


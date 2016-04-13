require 'rails_helper'

RSpec.describe "Item invoice_item api" do
  context "GET api/v1/items/:id/invoice_items" do
    it 'returns a collection of invoice_items' do
      Item.create(id: 1, name: "TV")
      InvoiceItem.create(id: 1, item_id: 1)
      InvoiceItem.create(id: 2, item_id: 1)

      get "/api/v1/items/1/invoice_items"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      invoice_item_ids = body.map do |iv|
        iv['id']
      end
      expect(invoice_item_ids).to match_array([1, 2])
    end
  end
end

require 'rails_helper'

RSpec.describe "InvoiceItems items API" do
  context "GET api/v1/items_item/:id/items" do
    it "returns all the items for invoice_item" do
      item1 = Item.create(id: 1, name: "TV")
      InvoiceItem.create(id: 4, item_id: item1.id)

      get "/api/v1/invoice_items/4/item"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)

      expect(body['name']).to eq("TV")
    end
  end
end


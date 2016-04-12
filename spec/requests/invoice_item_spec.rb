require 'rails_helper'

RSpec.describe "InvoiceItem API" do
  context "GET api/v1/invoice_items" do
    it "returns all the invoice_items" do
      Item.create(id: 1)
      Item.create(id: 2)
      InvoiceItem.create(item_id: 1)
      InvoiceItem.create(item_id: 2)

      get "/api/v1/invoice_items"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      invoice_items = body.map { |invoice_item| invoice_item["item_id"] }

      expect(invoice_items).to match_array([1, 2])
    end
  end

  context "GET api/v1/invoice_item/:id" do
    it 'returns a single invoice_item' do
      Item.create(id: 1)
      InvoiceItem.create(id: 1, item_id: 1, quantity: 400)

      get '/api/v1/invoice_items/1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['item_id']).to eq 1
      expect(body['quantity']).to eq 400
    end
  end

  context "GET api/v1/invoice_item_items/find?id=1" do
    it 'returns a single with a find action' do
      Item.create(id: 1)
      InvoiceItem.create(id: 1, item_id: 1, quantity: 400)

      get '/api/v1/invoice_items/find?id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['item_id']).to eq 1
      expect(body['quantity']).to eq 400
    end
  end

  context "GET api/v1/invoice_item_items/find_all?item_id=1" do
    it 'returns a single with a find action' do
      Item.create(id: 1)
      Item.create(id: 2)
      Item.create(id: 3)
      InvoiceItem.create(id: 1, item_id: 1)
      InvoiceItem.create(id: 2, item_id: 1)
      InvoiceItem.create(id: 3, item_id: 1)

      get '/api/v1/invoice_items/find_all?item_id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      found = body.map do |b|
        b['item_id']
      end

      expect(found).to match_array [1, 1, 1]
    end
  end
end



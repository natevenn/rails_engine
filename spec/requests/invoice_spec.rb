require 'rails_helper'

RSpec.describe "Invoice API" do
  context "GET api/v1/invoice" do
    it "returns all the invoices" do
      Customer.create(id: 1)
      Customer.create(id: 2)
      invoice1 = Invoice.create(customer_id: 1)
      invoice2 = Invoice.create(customer_id: 2)

      get "/api/v1/invoices"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      invoices = body.map { |invoice| invoice["customer_id"] }

      expect(invoices).to match_array([1, 2])
    end
  end

  context "GET api/v1/invoice/:id" do
    it 'returns a single invoice' do
      Customer.create(id: 1)
      Invoice.create(id: 1, customer_id: 1)

      get '/api/v1/invoices/1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['customer_id']).to eq 1
    end
  end

  context "GET api/v1/invoices/find?id=1" do
    it 'returns a single with a find action' do
      Customer.create(id: 1)
      Invoice.create(id: 1, customer_id: 1, status: 'pending')

      get '/api/v1/invoices/find?id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['status']).to eq 'pending'
      expect(body['customer_id']).to eq 1
    end
  end

  context "GET api/v1/invoices/find_all?customer_id=1" do
    it 'returns a single with a find action' do
      Customer.create(id: 1)
      Customer.create(id: 2)
      Customer.create(id: 3)
      Invoice.create(id: 1, customer_id: 1)
      Invoice.create(id: 2, customer_id: 1)
      Invoice.create(id: 3, customer_id: 1)

      get '/api/v1/invoices/find_all?customer_id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      found = body.map do |b|
        b['customer_id']
      end

      expect(found).to match_array [1, 1, 1]
    end
  end
end


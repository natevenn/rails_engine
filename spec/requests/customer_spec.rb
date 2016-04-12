require 'rails_helper'

RSpec.describe "Customer API" do
  context "GET api/v1/customer" do
    it "returns all the customers" do
      customer1 = Customer.create(first_name: 'Nate')
      customer2 = Customer.create(first_name: 'Sue')

      get "/api/v1/customers"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      customer_first_names = body.map { |m| m["first_name"] }

      expect(customer_first_names).to match_array(["Nate",
                                           "Sue"])
    end
  end

  context "GET api/v1/customer/:id" do
    it 'returns a single customer' do
      Customer.create(id: 1, first_name: "JoeBob", last_name: 'Marmot')

      get '/api/v1/customers/1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['first_name']).to eq "JoeBob"
      expect(body['last_name']).to eq "Marmot"
    end
  end

  context "GET api/v1/customers/find?id=1" do
    it 'returns a single with a find action' do
      Customer.create(id: 1, first_name: "Billy")

      get '/api/v1/customers/find?id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['first_name']).to eq 'Billy'
    end
  end

  context "GET api/v1/customers/find?first_name=Wilcox" do
    it 'returns a single customer with a find action' do
      Customer.create(id: 1, first_name: "Wilcox")

      get '/api/v1/customers/find?first_name=Wilcox'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['first_name']).to eq 'Wilcox'
    end
  end

  context "GET api/v1/customers/find_all?first_name=Cummings-Thiel" do
    it 'returns a single with a find action' do
      Customer.create(id: 1, first_name: "Thiel")
      Customer.create(id: 2, first_name: "Thiel")
      Customer.create(id: 3, first_name: "Thiel")

      get '/api/v1/customers/find_all?first_name=Thiel'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      found = body.map do |b|
        b['first_name']
      end

      expect(found).to match_array ['Thiel', 'Thiel', 'Thiel']
    end
  end
end


require 'rails_helper'

RSpec.describe "Merchant API" do
  context "GET api/v1/merchant" do
    it "returns all the merchants" do
      merchant1 = Merchant.create(name: 'Merchant1')
      merchant2 = Merchant.create(name: 'Merchant2')

      get "/api/v1/merchants", {}, { "Accept" => "application/json" }

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      merchant_names = body.map { |m| m["name"] }

      expect(merchant_names).to match_array(["Merchant1",
                                           "Merchant2"])
    end
  end

  context "GET api/v1/merchants/:id" do
    it 'returns a single merchant' do
      Merchant.create(id: 1, name: "JoeBob")

      get '/api/v1/merchants/1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['name']).to eq "JoeBob"
    end
  end

  context "GET api/v1/merchants/find?id=1" do
    it 'returns a single with a find action' do
      Merchant.create(id: 1, name: "Billy")

      get '/api/v1/merchants/find?id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['name']).to eq 'Billy'
    end
  end

  context "GET api/v1/merchants/find?name=Wilcox-Moore" do
    it 'returns a single merchant with a find action' do
      Merchant.create(id: 1, name: "Wilcox-Moore")

      get '/api/v1/merchants/find?name=Wilcox-Moore'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['name']).to eq 'Wilcox-Moore'
    end
  end

  context "GET api/v1/merchants/find_all?name=Cummings-Thiel" do
    it 'returns a single with a find action' do
      Merchant.create(id: 1, name: "Cummings-Thiel")
      Merchant.create(id: 2, name: "Cummings-Thiel")
      Merchant.create(id: 3, name: "Cummings-Thiel")

      get '/api/v1/merchants/find_all?name=Cummings-Thiel'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      found = body.map do |b|
        b['name']
      end

      expect(found).to match_array ['Cummings-Thiel', 'Cummings-Thiel', 'Cummings-Thiel']
    end
  end
end

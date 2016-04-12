require 'rails_helper'

RSpec.describe "Item API" do
  context "GET api/v1/item" do
    it "returns all the items" do
      item1 = Item.create(name: 'computer')
      item2 = Item.create(name: 'tv')

      get "/api/v1/items"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      item_names = body.map { |m| m["name"] }

      expect(item_names).to match_array(["computer",
                                           "tv"])
    end
  end

  context "GET api/v1/item/:id" do
    it 'returns a single item' do
      Item.create(id: 1, name: "TV", description: 'LED', unit_price: 2000)

      get '/api/v1/items/1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['name']).to eq "TV"
      expect(body['description']).to eq "LED"
    end
  end

  context "GET api/v1/items/find?id=1" do
    it 'returns a single with a find action' do
      Item.create(id: 1, name: "TV", description: 'LED', unit_price: 2000)

      get '/api/v1/items/find?id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['name']).to eq 'TV'
      expect(body['description']).to eq "LED"
    end
  end

  context "GET api/v1/items/find?name=TV" do
    it 'returns a single item with a find action' do
      Item.create(id: 1, name: "TV", description: 'LED', unit_price: 2000)

      get '/api/v1/items/find?name=TV'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['name']).to eq 'TV'
    end
  end

  context "GET api/v1/items/find_all?name=TV" do
    it 'returns a single with a find action' do
      Item.create(id: 1, name: "TV", description: 'LED', unit_price: 2000)
      Item.create(id: 2, name: "TV", description: 'plasma', unit_price: 1000)
      Item.create(id: 3, name: "TV", description: 'tube', unit_price: 200)

      get '/api/v1/items/find_all?name=TV'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      item_names = body.map do |b|
        b['name']
      end

      expect(item_names).to match_array ['TV', 'TV', 'TV']
    end
  end
end



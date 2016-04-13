require 'rails_helper'

RSpec.describe "Transaction API" do
  context "GET api/v1/transaction" do
    it "returns all the transactions" do
      transaction1 = Transaction.create(result: 'pending')
      transaction2 = Transaction.create(result: 'canceled')

      get "/api/v1/transactions"

      expect(response.status).to eq 200

      body = JSON.parse(response.body)
      transaction_result = body.map { |m| m["result"] }

      expect(transaction_result).to match_array(["pending",
                                           "canceled"])
    end
  end

  context "GET api/v1/transactions/:id" do
    it 'returns a single transaction' do
      Transaction.create(id: 1, result: "pending")

      get '/api/v1/transactions/1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['result']).to eq "pending"
    end
  end

  context "GET api/v1/transactions/find?id=1" do
    it 'returns a single with a find action' do
      Transaction.create(id: 1, result: "pending")

      get '/api/v1/transactions/find?id=1'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['result']).to eq 'pending'
    end
  end

  context "GET api/v1/transactions/find?name=Wilcox-Moore" do
    it 'returns a single transaction with a find action' do
      Transaction.create(id: 1, result: "pending")

      get '/api/v1/transactions/find?result=pending'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)

      expect(body['result']).to eq 'pending'
    end
  end

  context "GET api/v1/transactions/find_all?name=Cummings-Thiel" do
    it 'returns a single with a find action' do
      Transaction.create(id: 1, result: "Cummings-Thiel")
      Transaction.create(id: 2, result: "Cummings-Thiel")
      Transaction.create(id: 3, result: "Cummings-Thiel")

      get '/api/v1/transactions/find_all?result=Cummings-Thiel'

      expect(response.status).to eq 200
      body = JSON.parse(response.body)
      found = body.map do |b|
        b['result']
      end

      expect(found).to match_array ['Cummings-Thiel', 'Cummings-Thiel', 'Cummings-Thiel']
    end
  end
end


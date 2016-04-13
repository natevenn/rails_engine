require 'rails_helper'

RSpec.describe Merchant, type: :model do
  context 'merchant with top revenue' do
    it 'returns top merchants' do
      merchant1 = Merchant.create(id: 1, name: "Merchant1")
      merchant2 = Merchant.create(id: 2, name: "Merchant1")
      merchant3 = Merchant.create(id: 3, name: "Merchant1")
      Item.create(id: 1, name: 'TV', merchant_id: 1)
      Invoice.create(id: 1, merchant_id: 1)
      Invoice.create(id: 2, merchant_id: 2)
      Invoice.create(id: 3, merchant_id: 3)
    end
  end
end

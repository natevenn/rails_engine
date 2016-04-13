class Api::V1::Items::MerchantController < ApplicationController
  respond_to :json

  def index
    item = Item.find_by(id: params['item_id'])
    respond_with Merchant.find_by(id: item['merchant_id'])
  end
end

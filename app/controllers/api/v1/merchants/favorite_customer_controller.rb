class Api::V1::Merchants::FavoriteCustomerController < ApplicationController
  respond_to :json

  def show
    respond_with Merchant.find_by(id: params['merchant_id']).favorite_customer
  end
end

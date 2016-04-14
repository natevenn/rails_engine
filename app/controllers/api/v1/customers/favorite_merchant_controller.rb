class Api::V1::Customers::FavoriteMerchantController < ApplicationController
  respond_to :json

  def show
    respond_with Customer.find_by(id: params['customer_id']).favorite_merchant
  end

end

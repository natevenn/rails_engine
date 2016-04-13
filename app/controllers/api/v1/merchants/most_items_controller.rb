class Api::V1::Merchants::MostItemsController < ApplicationController
  respond_to :json

  def index
    respond_with Merchant.top_merchants_ranked_by_total_items(params['quantity'])
  end
end

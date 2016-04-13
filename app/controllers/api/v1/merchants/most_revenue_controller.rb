class Api::V1::Merchants::MostRevenueController < ApplicationController
  respond_to :json
  def index
    respond_with Merchant.top_merchants_ranked_by_total_revenue(params['quantity'])
  end
end

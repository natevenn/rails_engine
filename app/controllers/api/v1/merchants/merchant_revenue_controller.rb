class Api::V1::Merchants::MerchantRevenueController < ApplicationController
  respond_to :json

  def show
    if params['date']
      respond_with Invoice.total_revenue_for_merchant_by_date(params['date'], params['merchant_id'])
    else
      respond_with Merchant.total_merchant_revenue(params['merchant_id'])
    end
  end
end

class Api::V1::Merchants::RevenueController < ApplicationController
  respond_to :json

  def show
    respond_with Invoice.total_revenue_by_date(params['date'])
  end
end

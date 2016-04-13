class Api::V1::Invoices::MerchantController < ApplicationController
  respond_to :json

  def index
    respond_with Invoice.find_by(id: params['invoice_id']).merchant
  end
end

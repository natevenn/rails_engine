class Api::V1::InvoiceItems::ItemController < ApplicationController
  respond_to :json

  def index
    invoice_item = InvoiceItem.find_by(id: params['invoice_item_id'])
    respond_with invoice_item.item
  end
end


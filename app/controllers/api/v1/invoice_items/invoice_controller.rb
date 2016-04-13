class Api::V1::InvoiceItems::InvoiceController < ApplicationController
  respond_to :json

  def index
    invoice_item = InvoiceItem.find_by(id: params['invoice_item_id'])
    respond_with invoice_item.invoice
    #respond_with Invoice.find_by(id: invoice_item)
  end
end

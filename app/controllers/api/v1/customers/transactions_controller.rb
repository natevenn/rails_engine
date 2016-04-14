class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    invoices = Invoice.where(customer_id: params['customer_id'])
    respond_with Transaction.where(invoice_id: invoices)
  end
end

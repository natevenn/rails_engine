class Api::V1::Customers::TransactionsController < ApplicationController
  respond_to :json

  def index
    invoices = Invoice.where(customer_id: 1)
    respond_with Transaction.where(invoice_id: invoices)
  end
end




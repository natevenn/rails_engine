class Api::V1::Transactions::InvoiceController < ApplicationController
  respond_to :json

  def index
    transaction = Transaction.find_by(id: params['transaction_id'])
    respond_with transaction.invoice
  end
end


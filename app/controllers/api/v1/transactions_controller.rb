module Api
  module V1
    class TransactionsController < ApplicationController
      respond_to :json

      def index
        respond_with Transaction.all
      end

      def show
        respond_with Transaction.find(params[:id])
      end

      def find
        respond_with Transaction.find_by(transaction_params)
      end

      def find_all
        respond_with Transaction.where(transaction_params)
      end

      def random
        respond_with Transaction.order("RANDOM()").first
      end

      private
        def transaction_params
          params.permit(:id, :invoice_id, :result, :credit_card_number, :updated_at, :created_at)
        end
    end
  end
end

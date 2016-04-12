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
        if transaction_params[:id]
          respond_with Transaction.find_by(transaction_params)
        else
          key = transaction_params.keys.first
          value = transaction_params.values.first
          respond_with Transaction.find_by("lower(#{key}) = ?", value.downcase)
        end
      end

      def find_all
        if transaction_params[:id]
          respond_with Transaction.where(transaction_params)
        else
          key = transaction_params.keys.first
          value = transaction_params.values.first
          respond_with Transaction.where("lower(#{key}) = ?", value.downcase)
        end
      end

      def random
        respond_with Transaction.order("RANDOM()").first
      end

      private
        def transaction_params
          params.permit(:id, :invoice_id, :result)
        end
    end
  end
end

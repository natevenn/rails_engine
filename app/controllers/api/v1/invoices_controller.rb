module Api
  module V1
    class InvoicesController < ApplicationController
      respond_to :json

      def index
        respond_with Invoice.all
      end

      def show
        respond_with Invoice.find(params[:id])
      end

      def find
        respond_with Invoice.find_by(invoice_params)
      end

      def find_all
        respond_with Invoice.where(invoice_params)
      end

      private
        def invoice_params
          params.permit(:id, :customer_id, :merchant_id, :status)
        end
    end
  end
end

module Api
  module V1
    module Merchants
      class SearchController < MerchantsController
        respond_to :json

        def show
          respond_with Merchant.find_by(merchant_params)
        end

        def index
          respond_with Merchant.where(merchant_params)
        end

        def random
          respond_with Merchant.order("RANDOM()").first
        end
      end
    end
  end
end

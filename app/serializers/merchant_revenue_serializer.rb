class MerchantRevenueSerializer < ActiveModel::Serializer
  attributes :total_revenue

  def total_revenue
    object.total_revenue
  end
end

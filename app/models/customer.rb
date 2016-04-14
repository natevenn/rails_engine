class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :merchants, through: :invoices

  scope :successful_transactions, -> { joins(invoices: :transactions)
    .where(transactions: {result: 'success'}) }

  def favorite_merchant
    merchants.select('merchants.*', 'COUNT(merchants) AS merchant_count')
      .joins(invoices: :merchant)
      .group(:id)
      .order('merchant_count DESC')
      .first
  end
end

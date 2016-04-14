class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  scope :successful_transactions, -> { joins(:transactions)
    .where(transactions: {result: 'success'}) }

  def self.total_revenue_by_date(date)
    total_revenue = successful_transactions
      .where('invoices.created_at = ?', date)
      .joins(:invoice_items)
      .sum('invoice_items.quantity * invoice_items.unit_price')
    { 'total_revenue' => total_revenue }
  end

  def self.total_revenue_for_merchant_by_date(date, merchant_id)
    revenue = successful_transactions
      .where('invoices.created_at = ? AND
             invoices.merchant_id = ?', date, merchant_id)
      .joins(:invoice_items)
      .sum('invoice_items.quantity * invoice_items.unit_price')
    { 'revenue' => revenue }
  end
end

class Invoice < ActiveRecord::Base
  belongs_to :customer
  belongs_to :merchant
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.total_revenue_by_date(date)
    { 'total_revenue' => where('invoices.created_at = ?', date).joins(:transactions, :invoice_items).
      where(transactions: {result: 'success'}).
      sum('invoice_items.quantity * invoice_items.unit_price') }
  end

  def self.total_revenue_for_merchant_by_date(date, merchant_id)
    { 'revenue' => where('invoices.created_at = ? AND invoices.merchant_id = ?', date, merchant_id).
      joins(:transactions, :invoice_items).where(transactions: {result: 'success'}).
      sum('invoice_items.quantity * invoice_items.unit_price') }
  end
end

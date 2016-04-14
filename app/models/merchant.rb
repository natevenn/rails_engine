class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices
  has_many :customers, through: :invoices

  def self.top_merchants_ranked_by_total_revenue(quantity)
    select('merchants.*', 'SUM(invoice_items.quantity *
           invoice_items.unit_price) AS revenue').
           joins(:invoices => [:transactions, :invoice_items]).
           where(transactions: {result: 'success'}).
           group(:id).order('revenue DESC').take(quantity.to_i)
  end

  def self.top_merchants_ranked_by_total_items(quantity)
    select('merchants.*', 'SUM(invoice_items.quantity) AS quantity').
      joins(:invoices => [:transactions, :invoice_items]).
      where(transactions: {result: 'success'}).group(:id).
      order('quantity DESC').take(quantity.to_i)
  end

  def self.total_merchant_revenue(id)
    { 'revenue' => select('merchants.*', 'SUM(invoice_items.quantity *
           invoice_items.unit_price) AS revenue').
           joins(:invoices => [:transactions, :invoice_items]).
           where(transactions: {result: 'success'}).where('merchants.id = ?', id).group(:id).first.revenue }
  end

  def favorite_customer
    customers.select('customers.*', 'COUNT(transactions) AS transaction_count').
      joins(invoices: :transactions).
      where(transactions: {result: 'success'}).group(:id).
      order('transaction_count DESC').first
  end
end

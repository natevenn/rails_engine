class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

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
end

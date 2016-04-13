class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices
  has_many :invoice_items, through: :invoices

  def self.top_merchants_ranked_by_total_revenue(number)
    # results all invoices with merchants where transaction results = success
    #Invoice.joins(:merchant, :transactions).where(transactions: {result: 'success'})
    # returns all merchants with invoices where transaction result = success
    #Merchant.joins(:invoices, :transactions).where(transactions: {result: 'success'})

    #Merchant.map.with_object({}) do |merchant, hash|
      #hash[merchant.id] = merchant.invoice_items.total_price
    #end
   top = self.all.sort_by do |merchant|
      merchant.invoice_items.total_price
    end.take(number)
  end
end

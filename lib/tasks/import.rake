require 'csv'

desc "Import customers from csv file"
task :import => [:environment] do

  file = "sales_engine/data/customers.csv"
  count = 0

  CSV.foreach(file, :headers => true) do |row|
    count += 1
    Customer.create ({
      :first_name => row[1],
      :last_name => row[2],
      :created_at => row[3],
      :updated_at => row[4]
    })
    puts "Customer #{count} created"
  end
end

desc "Import merchants from csv file"
task :import => [:environment] do

  file = "sales_engine/data/merchants.csv"
  count = 0

  CSV.foreach(file, :headers => true) do |row|
    count += 1
    Merchant.create ({
      :name        => row[1],
      :created_at  => row[2],
      :updated_at  => row[3]
    })
    puts "Merchant #{count} created"
  end
end

desc "Import invoices from csv file"
task :import => [:environment] do

  file = "sales_engine/data/invoices.csv"
  count = 0

  CSV.foreach(file, :headers => true) do |row|
    count += 1
    Invoice.create ({
      :customer_id => row[1],
      :merchant_id => row[2],
      :status      => row[3],
      :created_at => row[4],
      :updated_at => row[5]
    })
    puts "Invoice #{count} created"
  end
end

desc "Import items from csv file"
task :import => [:environment] do

  file = "sales_engine/data/items.csv"
  count = 0

  CSV.foreach(file, :headers => true) do |row|
    count += 1
    Item.create ({
      :name        => row[1],
      :description => row[2],
      :unit_price  => row[3],
      :merchant_id => row[4],
      :created_at  => row[5],
      :updated_at  => row[6]
    })
    puts "Item #{count} created"
  end
end

desc "Import invoices_items from csv file"
task :import => [:environment] do

  file = "sales_engine/data/invoice_items.csv"
  count = 0

  CSV.foreach(file, :headers => true) do |row|
    count += 1
    InvoiceItem.create ({
      :item_id    => row[1],
      :invoice_id => row[2],
      :quantity   => row[3],
      :unit_price => row[4],
      :created_at => row[5],
      :updated_at => row[6]
    })
    puts "InvoiceItem #{count} created"
  end
end


desc "Import transactions from csv file"
task :import => [:environment] do

  file = "sales_engine/data/transactions.csv"
  count = 0

  CSV.foreach(file, :headers => true) do |row|
    count += 1
    Transaction.create ({
      :invoice_id         => row[1],
      :credit_card_number => row[2],
      :result             => row[4],
      :created_at         => row[5],
      :updated_at         => row[6]
    })
    puts "Transaction #{count} created"
  end
end

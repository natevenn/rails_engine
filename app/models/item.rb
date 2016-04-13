class Item < ActiveRecord::Base
  before_validation(on: :create) do
    self.unit_price = (unit_price.to_f) / 100
  end

  belongs_to :merchant
end

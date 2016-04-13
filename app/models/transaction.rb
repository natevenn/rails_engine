class Transaction < ActiveRecord::Base
  belongs_to :invoice

  #scope :result, -> {where(result: 'success')}
end

class Order < ApplicationRecord
  
  enum payment: {クレジットカード: 0, 銀行振込: 1}
  
  has_many :order_details
  
  belongs_to :customer
end

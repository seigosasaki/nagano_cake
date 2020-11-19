class OrderDetail < ApplicationRecord
  
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  attr_accessor :collection  
  
  
  belongs_to :order
  belongs_to :item
  
  

end

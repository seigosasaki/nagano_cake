class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :last_name,         presence: true, length: {maximum: 10 }
  validates :first_name,        presence: true, length: {maximum: 10 }
  validates	:last_name_kana,    presence: true, length: {maximum: 10 }
  validates :first_name_kana,   presence: true, length: {maximum: 10 }
  validates :telephone_number, 	presence: true, length: {maximum: 12, minimum: 10 }
  validates :postal_code,       presence: true, length: {maximum: 7 }
  validates :address, 		      presence: true, length: {maximum: 255 }
  validates :email, 			      presence: true, length: {maximum: 255 }
  validates :is_active,        inclusion: [true, false]



  has_many :cart_items
  has_many :orders
  has_many :order_details


  def active_for_authentication?
    super && is_active
  end

  def inactive_message
    is_active ? super : :mail_not_replied
  end
end

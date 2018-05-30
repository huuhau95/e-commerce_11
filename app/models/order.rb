class Order < ApplicationRecord
  belongs_to :user
<<<<<<< d960cc5b187dadb3c2689fdfb1a758f2c45b23e6
  has_many :order_details
  validates :phone, presence: true, numericality: {only_integer: true}
  validates :address, presence: true, length: {maximum: Settings.settings.max_value_address,
    minimum: Settings.settings.min_value_address}
=======
  has_many :order_details, dependent: :destroy

  validates :status, presence: true
>>>>>>> manage_orders
end

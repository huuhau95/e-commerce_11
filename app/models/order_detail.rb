class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  scope :statistic_this_day, ->{where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)}
end

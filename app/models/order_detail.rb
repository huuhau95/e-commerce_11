class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :product

  delegate :name, :images, to: :product, allow_nil: true

  scope :statistic_this_day, ->{where(created_at: Date.today.beginning_of_day..Date.today.end_of_day)}
end

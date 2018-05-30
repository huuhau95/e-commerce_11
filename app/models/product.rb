class Product < ApplicationRecord
  belongs_to :category
<<<<<<< d960cc5b187dadb3c2689fdfb1a758f2c45b23e6
  has_many :ratings
  has_many :comments
  has_many :order_details
  has_many :images, dependent: :destroy
=======
  has_many :ratings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :order_details, dependent: :destroy
>>>>>>> manage_orders

  scope :order_product, ->{order created_at: :desc}
  scope :search_by_name, ->(name){where("name LIKE ? ", "%#{name}%") if name.present?}
  scope :filter_by_category, ->(category_id){where(category_id: category_id) if category_id.present?}
  scope :filter_by_higher_price, ->(higher_price){where("price >= ?", higher_price) if higher_price.present?}
  scope :filter_by_less_price, ->(less_price){where("price <= ?", less_price) if less_price.present?}
  scope :total_this_month, ->type{joins(:order_details)
    .where(created_at: Date.today.beginning_of_month..Date.today.end_of_month)
    .group("products.name")
    .sum("order_details.#{type}")}

  def avg_rating
    ratings.average(:point)
  end

  def self.ransackable_attributes auth_object = nil
    %w(name price description)
  end
end

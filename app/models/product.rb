class Product < ApplicationRecord
  belongs_to :category
  has_many :ratings
  has_many :comments
  has_many :order_details
  has_many :images, dependent: :destroy

  scope :order_product, ->{order created_at: :desc}
  scope :search_by_name, ->(name){where("name LIKE ? ", "%#{name}%") if name.present?}
  scope :filter_by_category, ->(category_id){where(category_id: category_id) if category_id.present?}
  scope :filter_by_higher_price, ->(higher_price){where("price >= ?", higher_price) if higher_price.present?}
  scope :filter_by_less_price, ->(less_price){where("price <= ?", less_price) if less_price.present?}
end

class Order < ApplicationRecord
  belongs_to :user
  enum status: {pending: 0, checked: 1}
  has_many :order_details, dependent: :destroy
  default_scope -> { order created_at: :desc }
  scope :filter_by_status, ->(status){where(status: status) if status.present?}
  validates :phone, presence: true, numericality: {only_integer: true}
  validates :address, presence: true, length: {maximum: Settings.settings.max_value_address,
    minimum: Settings.settings.min_value_address}
  has_many :order_details, dependent: :destroy
  validates :status, presence: true
end

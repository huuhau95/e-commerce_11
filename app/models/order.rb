class Order < ApplicationRecord
  belongs_to :user
  enum status: {pending: 0, checked: 1, shipped: 2}

  has_many :order_details, dependent: :destroy
  default_scope -> { order created_at: :desc }
  scope :filter_by_status, ->(status){where(status: status) if status.present?}
  validates :phone, presence: true, numericality: {only_integer: true}
  validates :address, presence: true, length: {maximum: Settings.settings.max_value_address,
    minimum: Settings.settings.min_value_address}

  def self.ransackable_attributes auth_object = nil
    %w(address phone created_at status)
  end
end

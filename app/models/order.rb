class Order < ApplicationRecord
  belongs_to :user

  enum status: {pending: 0, checked: 1, shipped: 2}

  has_many :order_details, dependent: :destroy

  delegate :name, :email, to: :user, allow_nil: true

  scope :ordered, ->{order created_at: :desc}
  scope :filter_by_status, ->(status){where(status: status) if status.present?}

  validates :phone, presence: true, numericality: {only_integer: true}
  validates :address, presence: true, length: {maximum: Settings.order.max_length_address,
    minimum: Settings.order.min_length_address}

  def self.ransackable_attributes auth_object = nil
    %w(address phone created_at status)
  end
end

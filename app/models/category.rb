class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  enum status: [:hide, :display]

  validates :status, presence: true
  validates :name, presence: true, length: {maximum: 50}

  scope :ordered, ->{order created_at: :desc}
end

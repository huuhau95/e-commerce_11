class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  enum status: [:hide, :display]

  validates :name, presence: true, length: {maximum: 50}

  scope :ordered, ->{order created_at: :desc}
  scope :search_by_name, ->(name){where("name LIKE ? ", "%#{name}%") if name.present?}
end

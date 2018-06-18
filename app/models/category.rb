class Category < ApplicationRecord
  has_many :products, dependent: :destroy

  enum status: [:hide, :display]

  validates :name, presence: true,uniqueness: true, length: {maximum: Settings.validate.content_max_length}

  scope :ordered, ->{order created_at: :desc}
  scope :search_by_name, ->(name){where("name LIKE ? ", "%#{name}%") if name.present?}
end

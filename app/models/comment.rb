class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  delegate :name, :image, to: :user, allow_nil: true

  validates :description, presence: true,
    length: {maximum: Settings.validate.content_max_length}

  scope :search_by_description, ->(description){where("description LIKE ? ", "%#{description}%") if description.present?}
end

class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :comments
  has_many :orders
  has_many :ratings

  mount_uploader :image, PictureUploader

  enum status: [:user, :admin]

  before_save :downcase_email

  validates :name, presence: true,
   length: {maximum: Settings.validate.name_max_length}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.validate.email_max_length},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true,
    length: {minimum: Settings.validate.min_length_password}, allow_nil: true,
    :on => :create

  scope :user_info, ->{select :id, :name, :image, :email, :role, :created_at}
  scope :search_by_name, ->(name){where("name LIKE ? ", "%#{name}%") if name.present?}
  has_secure_password
  scope :admins, ->(role){where role: role}
  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def forget
    update_attribute :remember_digest, nil
  end

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end

  private

  def images_size
    if images.size > Settings.settings.max_size_image.megabytes
      errors.add :images, t("warning_size")
    end
  end

  def downcase_email
    email.downcase!
  end
end

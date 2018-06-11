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
  scope :search_by_name, ->(name){where("name LIKE ? ",
    "%#{name}%") if name.present?}
  scope :total_order_of_user, ->{joins(:orders).group(:user_id,:name).sum(:id)}
  scope :admins, ->(role){where role: role}

  has_secure_password

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

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def self.from_omniauth auth
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
    end
  end
  
  def update_with_password(params, *options)
    current_password = params.delete(:current_password)

    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end

    result = if params[:password].blank? || valid_password?(current_password)
      update_attributes(params, *options)
    else
      self.assign_attributes(params, *options)
      self.valid?
      self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
      false
    end

    clean_up_passwords
    result
  end

   class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
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

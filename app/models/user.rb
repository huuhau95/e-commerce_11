class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :comments, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :ratings, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  before_save{email.downcase!}

  validates :name, presence: true, length: {maximum: 50}
  validates :role, presence: true
  validates :email, presence: true, length: {maximum: 255},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 6}, allow_nil: true
  scope :user_info, ->{select :id, :name, :email, :role, :created_at}

  has_secure_password

  def self.digest string
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
      BCrypt::Engine.cost
    BCrypt::Password.create string, cost: cost
  end

  def forget
    update_attribute :remember_digest, nil
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_attribute :remember_digest, User.digest(remember_token)
  end

  def current_user? user
    user == current_user
  end

  def authenticated? attribute, token
    digest = self.send "#{attribute}_digest"
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  private

  def downcase_email
    email.downcase!
  end
end

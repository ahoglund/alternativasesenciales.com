class User < ActiveRecord::Base

  # Relations
  has_many :posts
  has_many :comments, as: :commenter

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :confirmable,
  :omniauthable, :omniauth_providers => [:twitter]

  # Pagination
  paginates_per 100

  # Validations
  # :email
  validates_format_of :email, with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  # Scopes
  scope :from_omniauth, -> {
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  }
  scope :paged, ->(page_number) { order(admin: :desc, email: :asc).page page_number }
  scope :last_signups, ->(count) {
    order(created_at: :desc).limit(count).select("id","email","created_at")
  }
  scope :last_signins, ->(count) {
      order(last_sign_in_at:
    :desc).limit(count).select("id","email","last_sign_in_at")
  }
  scope :users_count, -> {
    where("admin = ? AND locked = ?",false,false).count
  }

end

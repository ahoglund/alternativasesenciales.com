class User < ActiveRecord::Base
  
# Relations
has_many :posts

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


def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end

def self.paged(page_number)
  order(admin: :desc, email: :asc).page page_number
end

def self.last_signups(count)
  order(created_at: :desc).limit(count).select("id","email","created_at")
end

def self.last_signins(count)
  order(last_sign_in_at:
  :desc).limit(count).select("id","email","last_sign_in_at")
end

def self.users_count
  where("admin = ? AND locked = ?",false,false).count
end
end

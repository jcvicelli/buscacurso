class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save { self.email = email.downcase }
  validates :name,  presence: true, length: { maximum: 50}
  has_many :enderecos
  accepts_nested_attributes_for :enderecos, :reject_if => :all_blank, :allow_destroy => true
  has_many :companies
  has_many :courses
  has_many :employees, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :lockable, :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
   where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
     user.provider = auth.provider
     user.uid = auth.uid
     user.email = auth.info.email
     #user.password = Devise.friendly_token[0,20]
     user.confirmed_at = Date.today
     user.name = auth.info.name   # assuming the user model has a name
   end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end

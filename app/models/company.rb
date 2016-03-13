class Company < ActiveRecord::Base
  usar_como_cnpj :cnpj
  validates :name, presence: true
  has_many :enderecos
  has_many :courses
  has_many :employees, dependent: :destroy
  accepts_nested_attributes_for :enderecos, :reject_if => :all_blank, :allow_destroy => true
  has_and_belongs_to_many :category_types
  belongs_to :user

  before_save { self.email = email.downcase }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX }

end

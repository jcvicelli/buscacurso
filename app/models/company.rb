class Company < ActiveRecord::Base
  usar_como_cnpj :cnpj
  validates :name, presence: true
  has_many :enderecos
  has_many :courses
  has_many :employees, dependent: :destroy
  accepts_nested_attributes_for :enderecos, :reject_if => :all_blank, :allow_destroy => true
  has_and_belongs_to_many :category_types
  belongs_to :user
  #validates :user_id, presence: true
end

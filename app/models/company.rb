class Company < ActiveRecord::Base
  usar_como_cnpj :cnpj
  validates :name, presence: true
  has_many :enderecos
  accepts_nested_attributes_for :enderecos, :reject_if => :all_blank, :allow_destroy => true
end

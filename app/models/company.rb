class Company < ActiveRecord::Base
  belongs_to :user
  usar_como_cnpj :cnpj
  validates :name, presence: true
end

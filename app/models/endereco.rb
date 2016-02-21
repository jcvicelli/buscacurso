class Endereco < ActiveRecord::Base
  belongs_to :company
  belongs_to :user
  belongs_to :course
end

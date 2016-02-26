class Employee < ActiveRecord::Base
  belongs_to :user
  belongs_to :company

  validates :user, presence: true
end

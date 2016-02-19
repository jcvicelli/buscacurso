class CategoryType < ActiveRecord::Base
  belongs_to :category
  has_many :courses

  validates :name,  presence: true, length: { maximum: 50}
  validates :category_id,  presence: true
end

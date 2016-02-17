class CategoryType < ActiveRecord::Base
  belongs_to :category
  belongs_to :course

  validates :name,  presence: true, length: { maximum: 50}
  validates :category_id,  presence: true
end

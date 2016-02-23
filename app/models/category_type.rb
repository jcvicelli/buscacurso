class CategoryType < ActiveRecord::Base
  belongs_to :category
  has_many :courses
  has_and_belongs_to_many :companies

  validates :name,  presence: true, length: { maximum: 50}
  validates :category_id,  presence: true

  def select_label
    "#{category.name} | #{name}"
  end
end

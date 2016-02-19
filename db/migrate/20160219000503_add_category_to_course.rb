class AddCategoryToCourse < ActiveRecord::Migration
  def change
    add_reference :courses, :category_type, index: true, foreign_key: true
  end
end

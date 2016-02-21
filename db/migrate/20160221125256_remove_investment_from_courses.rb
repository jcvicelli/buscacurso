class RemoveInvestmentFromCourses < ActiveRecord::Migration
  def change
    remove_column :courses, :investment
  end
end

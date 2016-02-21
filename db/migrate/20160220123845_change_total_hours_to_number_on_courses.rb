class ChangeTotalHoursToNumberOnCourses < ActiveRecord::Migration
  def change
    change_column :courses, :total_hours, 'integer USING CAST(total_hours AS integer)'
  end
end

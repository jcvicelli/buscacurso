class ChangeStringToTextInCourse < ActiveRecord::Migration
  def change
    change_column :courses, :requirements, :text, :limit => nil
    change_column :courses, :lecturer_resume, :text, :limit => nil
  end
end

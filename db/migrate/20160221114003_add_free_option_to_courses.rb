class AddFreeOptionToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :free, :boolean
  end
end

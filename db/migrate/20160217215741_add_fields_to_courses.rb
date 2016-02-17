class AddFieldsToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :total_hours, :string
    add_reference :courses, :mode, index: true, foreign_key: true
    add_reference :courses, :area, index: true, foreign_key: true
    add_reference :courses, :certificate, index: true, foreign_key: true

    add_column :courses, :investment, :string
    add_column :courses, :payment_method, :string
    add_column :courses, :requirements, :string
    add_column :courses, :content, :string
    add_column :courses, :keywords, :string
    add_column :courses, :lecturer_name, :string
    add_column :courses, :lecturer_resume, :string
    add_column :courses, :link_inscription, :string
  end
end

class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :title
      t.text :description
      t.text :about
      t.string :place
      t.references :company, index: true, foreign_key: true
      t.string :rating
      t.datetime :begins_at
      t.datetime :ends_at

      t.timestamps null: false
    end
    add_index :courses, :title
  end
end

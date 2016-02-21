class AddCourseToEnderecos < ActiveRecord::Migration
  def change
    add_reference :enderecos, :course, index: true, foreign_key: true
  end
end

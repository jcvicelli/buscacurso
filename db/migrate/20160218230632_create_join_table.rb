class CreateJoinTable < ActiveRecord::Migration
  def change
    create_join_table :areas, :courses do |t|
      t.index [:area_id, :course_id]
      t.index [:course_id, :area_id]
    end
  end
end

class AddMoneyToCourses < ActiveRecord::Migration
  def change
    add_monetize :courses, :price
  end
end

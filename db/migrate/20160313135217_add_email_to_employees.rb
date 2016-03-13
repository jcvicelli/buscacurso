class AddEmailToEmployees < ActiveRecord::Migration
  def change
    add_column :employees, :email, :string, index: true
  end
end

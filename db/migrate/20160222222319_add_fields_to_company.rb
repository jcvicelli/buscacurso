class AddFieldsToCompany < ActiveRecord::Migration
  def change
    add_reference :companies, :user, index: true, foreign_key: true
    add_column :companies, :marketing, :boolean
    add_reference :companies, :category_type, index: true, foreign_key: true
  end
end

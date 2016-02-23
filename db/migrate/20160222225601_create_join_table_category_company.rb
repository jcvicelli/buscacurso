class CreateJoinTableCategoryCompany < ActiveRecord::Migration
  def change
    create_join_table :category_types, :companies do |t|
      t.index [:category_type_id, :company_id], :name => 'category_type_company_index'
      t.index [:company_id, :category_type_id], :name => 'company_category_type_index'
    end
  end
end

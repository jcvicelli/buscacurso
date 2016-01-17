class AddEmailToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :email, :string
    add_column :companies, :site, :string
  end
end

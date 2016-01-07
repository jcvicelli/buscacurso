class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :cnpj
      t.string :name
      t.string :phone
      t.string :contact
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :companies, :name, unique: true

  end
end

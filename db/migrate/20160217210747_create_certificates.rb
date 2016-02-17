class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :certificates, :name
  end
end

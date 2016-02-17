class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.string :name

      t.timestamps null: false
    end
    add_index :modes, :name
  end
end

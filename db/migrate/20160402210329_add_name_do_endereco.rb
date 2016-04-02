class AddNameDoEndereco < ActiveRecord::Migration
  def change
    add_column :enderecos, :nome, :string, index: true
  end
end

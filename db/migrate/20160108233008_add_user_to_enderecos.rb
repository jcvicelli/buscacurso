class AddUserToEnderecos < ActiveRecord::Migration
  def change
    add_reference :enderecos, :user, index: true
    add_foreign_key :enderecos, :users
  end
end

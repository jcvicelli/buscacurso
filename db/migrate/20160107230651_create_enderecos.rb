class CreateEnderecos < ActiveRecord::Migration
  def change
    create_table :enderecos do |t|
      t.string :cep
      t.string :logradouro
      t.string :bairro
      t.string :numero
      t.string :cidade
      t.string :estado
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
    
  end
end

FactoryGirl.define do
  factory :endereco do
    cep "81110070"
    logradouro { FFaker::Address.street_name }
    bairro "Centro"
    numero { FFaker::Address.building_number }
    cidade { FFaker::Address.city }
    estado "PR"
  end

end

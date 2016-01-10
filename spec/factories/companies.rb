FactoryGirl.define do
  factory :company do
    cnpj "27.138.265/0001-07"
    name { FFaker::Company.name }
    phone { FFaker::PhoneNumber.phone_number }
    contact { FFaker::NameBR.name }
  end

end

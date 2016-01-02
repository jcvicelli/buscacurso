FactoryGirl.define do
  factory :user do
    name { FFaker::NameBR.name }
    email { FFaker::Internet.email }
    password {Devise.friendly_token.first(8)}
    #confirmed_at Date.today
  end

end

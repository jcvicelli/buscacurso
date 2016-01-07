json.array!(@companies) do |company|
  json.extract! company, :id, :cnpj, :name, :phone, :contact, :user_id
  json.url company_url(company, format: :json)
end

json.array!(@companies) do |company|
  json.extract! company, :id, :cnpj, :name, :phone, :contact
  json.url company_url(company, format: :json)
end

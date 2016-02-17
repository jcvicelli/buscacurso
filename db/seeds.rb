# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Mode.count == 0
  puts "Creating Mode..."
  Mode.create(name: 'Presencial')
  Mode.create(name: 'Semi-presencial')
end

if Category.count == 0
  puts "Creating categories..."
  Category.create(name: 'Eventos')
  Category.create(name: 'Cursos')
end

if CategoryType.count == 0
  puts "Creating category type..."
  CategoryType.create(category_id: 1, name: 'WorkShop')
  CategoryType.create(category_id: 1, name: 'Simpósio')
  CategoryType.create(category_id: 1, name: 'Feira')
  CategoryType.create(category_id: 1, name: 'Congresso')
  CategoryType.create(category_id: 1, name: 'Encontro')
  CategoryType.create(category_id: 1, name: 'Fórum')
  CategoryType.create(category_id: 1, name: 'Evento')
  CategoryType.create(category_id: 1, name: 'Seminário')
  CategoryType.create(category_id: 1, name: 'Conferência')

  CategoryType.create(category_id: 2, name: 'Mini Cursos')
  CategoryType.create(category_id: 2, name: 'Técnico')
  CategoryType.create(category_id: 2, name: 'Graduação')
  CategoryType.create(category_id: 2, name: 'Pós-Graduação')
  CategoryType.create(category_id: 2, name: 'Mestrado')
  CategoryType.create(category_id: 2, name: 'Aprimoramento/aperfeiçoamento')
  CategoryType.create(category_id: 2, name: 'Profissionalizante')
  CategoryType.create(category_id: 2, name: 'Treinamento')

end

if Certificate.count == 0
  puts "Creating Certificates..."
  Certificate.create(name: 'Digital')
  Certificate.create(name: 'Físico')
  Certificate.create(name: 'Certificado pelo MEC')
end

if Area.count == 0
  puts "Creating areas..."
  Area.create(name: 'Agricultura')
  Area.create(name: 'Arquitetura')
  Area.create(name: 'Belas Artes')
  Area.create(name: 'Biblioteconomia')
  Area.create(name: 'Biografia')
  Area.create(name: 'Ciência e Conhecimento')
  Area.create(name: 'Ciências Aplicadas ')
  Area.create(name: 'Ciências da Informação')
  Area.create(name: 'Ciência Naturais')
  Area.create(name: 'Ciências Puras')
  Area.create(name: 'Ciências Sociais')
  Area.create(name: 'Comércio')
  Area.create(name: 'Cozinha e Culinária')
  Area.create(name: 'Design')
  Area.create(name: 'Direito')
  Area.create(name: 'Documentação')
  Area.create(name: 'Economia')
  Area.create(name: 'Educação')
  Area.create(name: 'Esportes')
  Area.create(name: 'Estatística')
  Area.create(name: 'Filosofia')
  Area.create(name: 'Folclore')
  Area.create(name: 'Geografia')
  Area.create(name: 'História')
  Area.create(name: 'Informática')
  Area.create(name: 'Estatística')
  Area.create(name: 'Jogos')
  Area.create(name: 'Língua')
  Area.create(name: 'Linguagem')
  Area.create(name: 'Linguística')
  Area.create(name: 'Literatura')
  Area.create(name: 'Matemática')
  Area.create(name: 'Medicina')
  Area.create(name: 'Música')
  Area.create(name: 'Política')
  Area.create(name: 'Psicologia')
  Area.create(name: 'Recreação')
  Area.create(name: 'Religião')
  Area.create(name: 'Saúde')
  Area.create(name: 'Seguro')
  Area.create(name: 'Sociedade')
  Area.create(name: 'Seguro')
  Area.create(name: 'Tecnologia')
  Area.create(name: 'Teologia')
  Area.create(name: 'Turismo')
end

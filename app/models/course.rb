class Course < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :company
  belongs_to :mode
  belongs_to :certificate
  belongs_to :category_type
  has_and_belongs_to_many :areas

  validates :title,  presence: true
  validates :company_id,  presence: true

  monetize :price_centavos
  has_many :enderecos
  accepts_nested_attributes_for :enderecos, :reject_if => :all_blank, :allow_destroy => true

  def self.search(query)
    __elasticsearch__.search(
      {
        query: {
          multi_match: {
            query: query,
            fields: ['title^10', 'description', 'about']
          }
        },
        highlight: {
          pre_tags: ['<em class="label label-highlight">'],
          post_tags: ['</em>'],
          fields: {
            title:   { number_of_fragments: 0 },
            description: { fragment_size: 25 },
            about: { fragment_size: 25 }
          }
        }
      }
    )
  end

end

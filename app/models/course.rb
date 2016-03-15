class Course < ActiveRecord::Base
  searchkick language: "brazilian"

  belongs_to :company
  belongs_to :mode
  belongs_to :certificate
  belongs_to :category_type
  has_and_belongs_to_many :areas
  belongs_to :user

  validates :user_id, presence: true
  validates :title,  presence: true
  validates :company_id,  presence: true
  validates :category_type,  presence: true

  monetize :price_centavos
  has_many :enderecos
  accepts_nested_attributes_for :enderecos, :reject_if => :all_blank, :allow_destroy => true


  def search_data
    attributes.merge(
      company_name: company.name,
      category_name: category_type.name,
      area_name: areas.map(&:name),
      mode_name: mode.try(:name),
      certificate_name: certificate.try(:name)
    )
  end


end

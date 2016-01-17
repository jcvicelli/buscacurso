class Course < ActiveRecord::Base
  include Elasticsearch::Model
  belongs_to :company
end

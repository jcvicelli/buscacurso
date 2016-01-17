class Course < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbackss
  
  belongs_to :company
end

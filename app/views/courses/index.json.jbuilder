json.array!(@courses) do |course|
  json.extract! course, :id, :title, :description, :about, :place, :company_id, :rating, :begins_at, :ends_at
  json.url course_url(course, format: :json)
end

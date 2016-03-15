module SearchHelper

  def link_to_lecturer(aggs, &block)
    link_to courses_path(params.merge(lecturer_name: aggs['key'])), &block
  end

  def link_to_company(aggs, &block)
    link_to courses_path(params.merge(company_name: aggs['key'])), &block
  end

  def link_to_category(aggs, &block)
    link_to courses_path(params.merge(category_name: aggs['key'])), &block
  end

  def link_to_area(aggs, &block)
    link_to courses_path(params.merge(area_name: aggs['key'])), &block
  end

  def link_to_mode(aggs, &block)
    link_to courses_path(params.merge(mode_name: aggs['key'])), &block
  end

  def link_to_certificate(aggs, &block)
    link_to courses_path(params.merge(certificate_name: aggs['key'])), &block
  end

end

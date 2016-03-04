module SearchHelper

  def link_to_lecturer(aggs, &block)
    link_to courses_path(params.merge(lecturer_name: aggs['key'])), &block
  end
end

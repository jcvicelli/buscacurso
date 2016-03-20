$ ->
  $('#course_search').typeahead
    name: "course"
    remote: "/courses/autocomplete?query=%QUERY"

module EventsHelper
  def event_view_id_determiner(name, index)
    index_suffix = index ? "_#{index}" : ''
    "event#{name}#{index_suffix}"
  end
end
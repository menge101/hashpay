class HasherListing < SitePrism::Section
elements :hasher_names, 'tbody#hasher_list tr td.name'
elements :kennels, 'tbody#hasher_list tr td.kennel'
end

class ViewPage < SitePrism::Page
  set_url '/events/1/whosecoming'
  element :flash_messages, 'div#flash_messages'
  section :event_info, EventInfoSection, 'div#event'
  iframe :map_iframe, MapIframe, '#map'
  section :hasher_listing, HasherListing, 'div#hashers'
end
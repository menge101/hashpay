class KennelPage < SitePrism::Page
  set_url '/hash{/abbreviation}'
  element :empty_event_listing, 'div#events'
  sections :events, EventInfoSection, "div[id^=\"event_\"]"
end
class KennelPage < SitePrism::Page
  set_url '/hash/P3H3'
  element :empty_event_listing, 'div#events'
  sections :events, EventInfoSection, "div[id^=\"event_\"]"
end
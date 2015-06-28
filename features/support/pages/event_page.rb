class EventInfoSection < SitePrism::Section
  element :event_what, 'dt#eventWhat'
  element :event_when, 'dt#eventWhen'
  element :event_where, 'dt#eventWhere'
  element :event_how, 'dt#eventHow'
  element :event_name, 'dd#eventName'
  element :event_description, 'dd#eventDescription'
  element :event_date, 'dd#eventDate'
  element :event_cost, 'dd#eventCost'
  element :event_location, 'dd#eventLocation'
end

class RegistrationSection < SitePrism::Section
  element :hash_name, 'input#hashName'
  element :kennel, 'input#kennel'
  element :add_button, 'button#add_button'
  element :add_tooltip, 'a#add_tooltip'
  element :new_tooltip, 'a#new_tooltip'
  element :stripe_button, 'input#formSubmitButton'
  element :credit_secure, 'a#credit_secure'
end

class MapSection < SitePrism::Section
  element :map, 'iframe#map'
end

class EventPage < SitePrism::Page
  set_url '/'
  section :event_info, EventInfoSection, 'div#event'
  section :map, MapSection, 'div#map-canvas'
  section :registration, RegistrationSection, 'div#rego'
end


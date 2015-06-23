class EventInfoSection < SitePrism::Section
  element :eventName, 'h1#eventName'
  element :eventDescription, 'h3#eventDescription'
  element :eventDate, 'h3#eventDate'
  element :eventCost, 'h3#eventCost'
end

class RegistrationSection < SitePrism::Section
  element :nameLabel, 'label#nameLabel'
  element :name, 'input#name'
  element :hashLabel, 'label#hashNameLabel'
  element :hashName, 'input#hashName'
  element :kennelLabel, 'label#kennelLabel'
  element :kennel, 'input#kennel'
end

class EventPage < SitePrism::Page
  set_url '/'
  section :event_info, EventInfoSection, 'div#event'
  section :registration, RegistrationSection, 'div#rego'
end


class StripeIframe < SitePrism::Page
  element :email, 'input#email'
  element :credit_card, 'input#credit_card'
  element :expiration, 'input#cc-exp'
  element :cvc, 'input#cc-csc'
  element :submit, 'button#submitButton'
end

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
  elements :hash_names, 'div.row div.form-group input.name-group'
  elements :kennels, 'div.row div.form-group input.kennel-group'
  element :add_button, 'button#add_button'
  element :add_tooltip, 'a#add_tooltip'
  element :new_tooltip, 'a#new_tooltip'
  element :stripe_button, 'button.stripe-button-el'
  element :credit_secure, 'a#credit_secure'
end

class MapIframe < SitePrism::Page

end

class EventPage < SitePrism::Page
  set_url '/'
  element :flash_messages, 'div#flash_messages'
  section :event_info, EventInfoSection, 'div#event'
  iframe :map_iframe, MapIframe, '#map'
  section :registration, RegistrationSection, 'div#rego'
  iframe :stripe_iframe, StripeIframe, '.stripe_checkout_app'
end


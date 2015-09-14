class StripeIframe < SitePrism::Page
  element :email, 'input#email'
  element :credit_card, 'input#credit_card'
  element :expiration, 'input#cc-exp'
  element :cvc, 'input#cc-csc'
  element :submit, 'button#submitButton'
end

class EventInfoSection < SitePrism::Section
  element :event_what, "dt[id^=\"eventWhat\"]"
  element :event_name, "dd[id^=\"eventName\"]"
  element :event_description, "dd[id^=\"eventDescription\"]"
  element :event_when, "dt[id^=\"eventWhen\"]"
  element :event_date, "dd[id^=\"eventDate\"]"
  element :event_how, "dt[id^=\"eventHow\"]"
  element :event_cost, "dd[id^=\"eventCost\"]"
  element :event_where, "dt[id^=\"eventWhere\"]"
  element :event_location, "dd[id^=\"eventLocation\"]"
  element :nav_button, "button[id^=\"event_nav_btn\"]"
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

class CommonFooterSection < SitePrism::Section
  element :facebook_link, 'a#facebook_link'
  element :facebook_button, 'img#facebook_button'
end

class EventPage < SitePrism::Page
  set_url '/events/1'
  element :flash_messages, 'div#flash_messages'
  section :event_info, EventInfoSection, 'div#event'
  iframe :map_iframe, MapIframe, '#map'
  section :registration, RegistrationSection, 'div#rego'
  iframe :stripe_iframe, StripeIframe, '.stripe_checkout_app'
  section :common_footer, CommonFooterSection, 'div#common_footer'
end


class FrontPage < SitePrism::Page
  set_url '/'
  section :flash, FlashMessageSection, 'div#flash_messages'
end
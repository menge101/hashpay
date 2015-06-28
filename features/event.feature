Feature:
  As an attendee,
  I want to register for an event,
  so that I can go have fun.

  Scenario: Event info is displayed
    When I navigate to the event page
    Then I see all expected elements on the page
    And the event name is 'P3H3 Inaug'
    And the event description is 'The first run of the Pittsburgh area Family hash'
    And the event location is 'Sanders St & Richmond Ave, Pittsburgh pa'
    And the event cost is '$5.00/person'




Feature:
  As an attendee,
  I want to register for an event,
  so that I can go have fun.

  Scenario: Event page is displayed
    When I navigate to the event page
    Then I see the event name
    And I see the event date
    And I see the event cost
    And I see the registration form

Feature:
  As an attendee,
  I want to register for an event,
  so that I can go have fun.

  Scenario: Event info is displayed
    When I navigate to the event page
    Then the event name is 'P3H3 Inaug'
    And the event description is 'The first run of the Pittsburgh area Family hash'
    And the event location is 'Sanders St & Richmond Ave, Pittsburgh pa'
    And the event cost is '$5.00/person'

  Scenario: Register a single attendee
    Given I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'pay with stripe' button
    Then the stripe payment overlay is displayed




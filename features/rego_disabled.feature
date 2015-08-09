Feature:
  As a system admin
  I want to be able to disable registration for events and kennels
  so that I can control what events people register for

  Scenario: Button on kennel page says 'event details' for rego disabled kennel
    Given a kennel with rego disabled
    And an event with rego enabled
    When I navigate to the kennel page
    Then the kennel page first event navigational button text reads 'Event Details'

  Scenario: Button on kennel page says 'event details' for rego disabled event
    Given a kennel with rego enabled
    And an event with rego disabled
    When I navigate to the kennel page
    Then the kennel page first event navigational button text reads 'Event Details'

  Scenario: Button on kennel page says 'Event Registration' for rego enabled event
    Given a kennel with rego enabled
    And an event with rego enabled
    When I navigate to the kennel page
    Then the kennel page first event navigational button text reads 'Event Registration'

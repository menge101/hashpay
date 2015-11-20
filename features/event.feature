Feature:
  As an attendee,
  I want to register for an event,
  so that I can go have fun.

  Scenario: Event info is displayed
    Given a default event
    When I navigate to the event page
    Then the event name is 'Test Event'
    And the event description is 'A test event'
    And the event location is '2020 Smallman Street, Pittsburgh, PA'
    And the event cost is '$50.01/person'
    And the event navigational button text reads 'Registration List'
    And facebook link is not present on event page

  Scenario: Register a single attendee
    Given a default event
    And I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'pay with stripe' button on the event page
    Then the stripe payment overlay is displayed
    When I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '$50.01 paid for Test Event registration for 1 person'
    And the 'whosecoming' page is displayed
    And the attendee list has 1 entry
    And the attendee list first entry has name 'Weasel' and kennel 'pgh-h3'
    And the event navigational button text reads 'Event Registration'

  Scenario: Multiple blank fields do not increase billing
    Given a default event
    And I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'add' button on the event page
    And I click the 'add' button on the event page
    And I click the 'pay with stripe' button on the event page
    Then the stripe payment overlay is displayed
    When I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '$50.01 paid for Test Event registration for 1 person'

  Scenario: Register two attendees
    Given a default event
    And I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    And I add an attendee with name 'PWE' and kennel 'Tokyo-hhh'
    When I click the 'pay with stripe' button on the event page
    Then the stripe payment overlay is displayed
    When the stripe payment overlay is displayed
    And I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '$100.02 paid for Test Event registration for 2 people'
    And the 'whosecoming' page is displayed
    And the attendee list has 2 entries
    And the attendee list first entry has name 'Weasel' and kennel 'pgh-h3'
    And the attendee list last entry has name 'PWE' and kennel 'Tokyo-hhh'

  Scenario: Register three attendees
    Given a default event
    And I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    And I add an attendee with name 'Cock Secret' and kennel 'SL-UT HHH'
    And I add an attendee with name 'PWE' and kennel 'Tokyo-hhh'
    When I click the 'pay with stripe' button on the event page
    Then the stripe payment overlay is displayed
    When I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '$150.03 paid for Test Event registration for 3 people'
    And the 'whosecoming' page is displayed
    And the attendee list has 3 entries
    And the attendee list first entry has name 'Weasel' and kennel 'pgh-h3'
    And the attendee list last entry has name 'PWE' and kennel 'Tokyo-hhh'

  Scenario: Credit Card rejection
    Given a default event
    And I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'pay with stripe' button on the event page
    Then the stripe payment overlay is displayed
    When I enter 'a random email' in the email field
    And I enter an invalid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then the stripe payment overlay is displayed
    And the credit card field is marked invalid

  Scenario: Verify event cost with zero cents maintains proper format
    Given an event with cost of '123.00'
    When I navigate to the event page
    Then the event name is 'Test Event'
    And the event description is 'A test event'
    And the event location is '2020 Smallman Street, Pittsburgh, PA'
    And the event cost is '$123.00/person'

  Scenario: Navigate to whose coming list without registering
    Given a default event
    And I navigate to the event page
    When I click on the 'Registration List' button
    Then the 'whosecoming' page is displayed
    When I click on the 'Event Registration' button
    Then the 'event' page is displayed

  Scenario: Event belongs to a kennel with a facebook link
    Given a kennel with facebook
    And a default event
    When I navigate to the event page
    Then the event name is 'Test Event'
    And the event description is 'A test event'
    And the event location is '2020 Smallman Street, Pittsburgh, PA'
    And the event cost is '$50.01/person'
    And the event navigational button text reads 'Registration List'
    And facebook link is present on event page
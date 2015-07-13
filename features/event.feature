Feature:
  As an attendee,
  I want to register for an event,
  so that I can go have fun.

  Background:
    Given a default event

  Scenario: Event info is displayed
    When I navigate to the event page
    Then the event name is 'Test Event'
    And the event description is 'A test event'
    And the event location is '2020 Smallman Street, Pittsburgh, PA'
    And the event cost is '$50.01/person'

  Scenario: Register a single attendee
    Given I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'pay with stripe' button
    And I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '50.01 paid for Test Event registration for 1 person'
    #And the 'whosecoming' page is displayed
    And the attendee list has 1 entry
    And the attendee list first entry has name 'Weasel' and kennel 'pgh-h3'

  Scenario: Multiple blank fields do not increase billing
    Given I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'add' button
    And I click the 'add' button
    And I click the 'pay with stripe' button
    And I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '50.01 paid for Test Event registration for 1 person'

  Scenario: Register two attendees
    Given I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    And I add an attendee with name 'PWE' and kennel 'Tokyo-hhh'
    When I click the 'pay with stripe' button
    And I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '100.02 paid for Test Event registration for 2 people'
    #And the 'whosecoming' page is displayed
    And the attendee list has 2 entries
    And the attendee list first entry has name 'Weasel' and kennel 'pgh-h3'
    And the attendee list last entry has name 'PWE' and kennel 'Tokyo-hhh'

  Scenario: Register three attendees
    Given I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    And I add an attendee with name 'Cock Secret' and kennel 'SL-UT HHH'
    And I add an attendee with name 'PWE' and kennel 'Tokyo-hhh'
    When I click the 'pay with stripe' button
    And I enter 'a random email' in the email field
    And I enter a valid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then a notice message is flashed reading '150.03 paid for Test Event registration for 3 people'
    #And the 'whosecoming' page is displayed
    And the attendee list has 3 entries
    And the attendee list first entry has name 'Weasel' and kennel 'pgh-h3'
    And the attendee list last entry has name 'PWE' and kennel 'Tokyo-hhh'

  Scenario: Credit Card rejection
    Given I navigate to the event page
    And the stripe payment overlay is not displayed
    And I set name to 'Weasel'
    And I set kennel to 'pgh-h3'
    When I click the 'pay with stripe' button
    And I enter 'a random email' in the email field
    And I enter an invalid visa card
    And I enter a expiration date in the future
    And I enter a cvc code of '123'
    And I click the stripe pay button
    Then the stripe payment overlay is displayed
    And the credit card field is marked invalid

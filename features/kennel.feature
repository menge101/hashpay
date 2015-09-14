Feature:
  As I kennel member,
  I want to see all the upcoming events for my kennel
  so I can register for them
  
  Scenario: An events exists, but it is in the past
    Given an event with a date 3 days in the past
    When I navigate to the kennel page
    Then I expect there to be no upcoming events

  Scenario: A kennel with facebook exists
    Given a kennel with facebook
    When I navigate to the kennel page
    Then facebook link is present on the kennel page

  Scenario: A kennel without facebook (default)
    Given a default kennel
    When I navigate to the kennel page
    Then facebook link is not present on the kennel page

Feature:
  As I kennel member,
  I want to see all the upcoming events for my kennel
  so I can register for them
  
  Scenario: An events exists, but it is in the past
    Given an event with a date 3 days in the past
    When I navigate to the kennel page
    Then I expect there to be no upcoming events

Feature:
  As a user,
  I want to upload gps data
  so that I can see everywhere I have run

  Scenario: User logged in, event is in the future, data upload is not displayed
    Given an authenticated user
    And an event in the future
    When I navigate to the event page
    Then the data upload section is not displayed

  Scenario: User not logged in, event is in the future, data upload is not displayed
    Given a user that is not authenticated
    And an event in the future
    When I navigate to the event page
    Then the data upload section is not displayed

  Scenario: User not logged in, event is in the past, data upload is not displayed
    Given a user that is not authenticated
    And an event in the past
    When I navigate to the event page
    Then the data upload section is not displayed

  Scenario: User logged in, event in the past, data upload is displayed
    Given an authenticated user
    And an event in the past
    When I navigate to the event page
    Then the data upload section is displayed

  Scenario: Data upload is successful
    Given a user and event where GPS data can be uploaded
    When I navigate to the event page
    And I enter 'running.gpx' in the file chooser
    And I click the submit button
    Then I should see a message reading 'GPS data uploaded'
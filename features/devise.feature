Feature:
  I want authentication.

  Scenario: Register a new user, confirm email and login
    When I navigate to the sign up page
    And I register as a new user with email 'test@test.org' and password 'testtest1'
    Then the 'front' page is displayed
    And a notice message is flashed reading 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    And an email has been sent
    When I navigate to the confirmation link in my email
    Then the 'login' page is displayed
    And a notice message is flashed reading 'Your email address has been successfully confirmed.'
    When I login with email 'test@test.org' and password 'testtest1'
    Then the 'front' page is displayed
    And a notice message is flashed reading 'Signed in successfully.'

  Scenario: Register a new user and try to login without confirmation
    When I navigate to the sign up page
    And I register as a new user with email 'test@test.org' and password 'testtest1'
    Then the 'front' page is displayed
    And a notice message is flashed reading 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    And an email has been sent
    When I navigate to the login page
    And I login with email 'test@test.org' and password 'testtest1'
    Then the 'login' page is displayed
    And a warning message is flashed reading 'You have to confirm your email address before continuing.'

  Scenario: Login with invalid credentials
    When I navigate to the login page
    And I login with email 'test@test.org' and password 'testtest1'
    Then the 'login' page is displayed
    And a warning message is flashed reading 'Invalid email or password.'
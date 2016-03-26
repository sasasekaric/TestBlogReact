Feature: Sign In
    To be able to create posts, user need to sign in

  Scenario: User that has confirmed account
    Given I am an user
    When I visit home page
    And I click Log In link
    And I try to login
    Then I should be redirected to 'home' page
    And I should see flash message 'Signed in successfully.'
    And I should see 'Sign Out' link

  Scenario: User that has not confirmed account
    Given I am an unconfirmed_user
    When I visit home page
    And I click Log In link
    And I try to login
    Then I should see flash message 'You have to confirm your email address before continuing.'
    And I should not see 'Sign Out' link

  Scenario: User that has locked account
    Given I am an locked_user
    When I visit home page
    And I click Log In link
    And I try to login
    Then I should see flash message 'Your account is locked.'
    And I should not see 'Sign Out' link

  Scenario: User with wrong credentials
    Given I am an user
    When I visit home page
    And I click Log In link
    And I try to login with email 'email@example.com' and password 'password'
    Then I should see flash message 'Invalid email or password.'
    And I should not see 'Sign Out' link

Feature: Sign Up
    To be able to create posts, user need to sign up

  Scenario: User with valid email, username, password and password confirmation
    Given I am an visitor
    When I visit home page
    And I click Sign Up link
    And I try to sign_up
    Then I should be redirected to 'home' page
    And I should see flash message 'A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.'
    And I should not see 'Sign Out' link

  Scenario: User with not uniq email
    Given I am an visitor
    And there is a user with email 'example@email.com'
    When I visit home page
    And I click Sign Up link
    And I try to sign_up with email 'example@email.com' and password 'password'
    And I should see flash message 'Email has already been taken'
    And I should not see 'Sign Out' link

  Scenario: User with not uniq username
    Given I am an visitor
    And there is a user with name 'username'
    When I visit home page
    And I click Sign Up link
    And I try to sign_up with name 'username'
    And I should see flash message 'Name has already been taken'
    And I should not see 'Sign Out' link

  Scenario: User with invalid email
    Given I am an visitor
    When I visit home page
    And I click Sign Up link
    And I try to sign_up with email 'something' and password 'somepassword'
    And I should see flash message 'Email is invalid'
    And I should not see 'Sign Out' link

  Scenario: User with short password
    Given I am an visitor
    When I visit home page
    And I click Sign Up link
    And I try to sign_up with email 'example@email.com' and password 'short'
    And I should see flash message 'Password is too short (minimum is 8 characters)'
    And I should not see 'Sign Out' link

  Scenario: User with long password
    Given I am an visitor
    When I visit home page
    And I click Sign Up link
    And I try to sign_up with email 'example@email.com' and password 'sajhjkdshckjsnbkjcnsjkncjksdnjkcxsjkaslknjcklsancpsdnajkcnsdjkncjkdsncjksdhckjdsjkcsjkdjkc'
    And I should see flash message 'Password is too long (maximum is 72 characters)'
    And I should not see 'Sign Out' link

  Scenario: User with password confirmation not match password
    Given I am an visitor
    When I visit home page
    And I click Sign Up link
    And I try to sign_up with password confirmation 'something'
    And I should see flash message 'Password confirmation doesn't match Password'
    And I should not see 'Sign Out' link


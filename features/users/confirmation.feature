Feature: Confirm instructions
    To be able to sign in, user need to confirm account

  Scenario: User signed up successfully
    Given I am an visitor
    When I visit home page
    And I click Sign Up link
    And I try to sign_up
    Then I should recive an email

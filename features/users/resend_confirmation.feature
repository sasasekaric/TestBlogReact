Feature: Resend confirm instructions
    When user confirmation token expire,
    user can resend confirmation instructions
    so he can sign in

  Scenario: User resend confirmation instructions with valid email
    Given I am an unconfirmed_user
    When I visit home page
    And I click Log In link
    And I click Didn't receive confirmation instructions? link
    And I try to resend confirmation instructions
    Then I should recive an email
    And I should see flash message 'You will receive an email with instructions for how to confirm your email address in a few minutes.'

  Scenario: User resend confirmation instructions with invalid email
    Given I am an unconfirmed_user
    When I visit home page
    And I click Log In link
    And I click Didn't receive confirmation instructions? link
    And I try to resend confirmation instructions with email 'example@email.com'
    Then I should not recive an email
    And I should see flash message 'Email not found'

Feature: Create Post

  Scenario: User as a visitor should not be able to create post
    Given I am an visitor
    And I visit home page
    When I click Create Post link
    Then I should see flash message 'You need to sign in or sign up before continuing.'

  Scenario: As loged in user it can create post with valid title and body
    Given I am an loged in user and there is 1 posts
    And I visit home page
    When I click Create Post link
    And I fill in title with "Something" and body with "Body text"
    Then I should see flash message 'Post was successfully created.'
    And I should see "Something" text
    And I should see "Body text" text

  Scenario: As loged in user with invalid title
    Given I am an loged in user and there is 1 posts
    And I visit home page
    When I click Create Post link
    And I fill in title with "" and body with "Body text"
    Then I should see flash message 'Title can't be blank'

  Scenario: As loged in user with invalid body
    Given I am an loged in user and there is 1 posts
    And I visit home page
    When I click Create Post link
    And I fill in title with "Title" and body with ""
    Then I should see flash message 'Body can't be blank'

Feature: Edit Post

  Scenario: User as a visitor should not be able to edit post
    Given I am an visitor and there is 1 posts
    When I visit home page
    And I click Read more... link
    Then I should see post title
    And I should see post body
    And I should not see 'Edit' link
    And I should not see 'Destroy' link

  Scenario: As a loged in user when user visit own post it should be able to edit and destroy post
    Given I am an loged in user and there is 1 posts
    When I visit home page
    And I click Read more... link
    Then I should see post title
    And I should see post body
    And I should see 'Edit' link
    And I should see 'Destroy' link

  Scenario: Loged in user goes to edit own post page
    Given I am an loged in user and there is 1 posts
    When I visit home page
    And I click Read more... link
    And I click Edit link
    Then I should see "Edit post" text

  Scenario: User try to update post with empty title
    Given I am an loged in user on edit post page
    When I update title with empty string
    And I click Update button
    Then I should see "Title can't be blank" text

  Scenario: User try to update post with empty body
    Given I am an loged in user on edit post page
    When I update body with empty string
    And I click Update button
    Then I should see "Body can't be blank" text

  Scenario: User update post with valid title
    Given I am an loged in user on edit post page
    When I update body with "New Title"
    And I click Update button
    Then I should see flash message 'Post was successfully updated.'
    And I should be redirected to post page
    And I should see "New Title" text

  Scenario: User update post with valid body
    Given I am an loged in user on edit post page
    When I update body with "New body"
    And I click Update button
    Then I should see flash message 'Post was successfully updated.'
    And I should be redirected to post page
    And I should see "New body" text

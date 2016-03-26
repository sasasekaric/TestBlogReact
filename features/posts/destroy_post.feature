Feature: Destroy Post

  Scenario: User as a visitor should not be able to destroy post
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

  Scenario: User destroy post
    Given I am an loged in user and there is 1 posts
    When I visit home page
    And I click Read more... link
    And I click Destroy link
    Then I should see flash message 'Post was successfully destroyed.'

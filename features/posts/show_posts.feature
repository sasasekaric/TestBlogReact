Feature: Show Posts

  Scenario: User as a visitor should be able to see posts
    Given I am an visitor and there is 3 posts
    When I visit home page
    Then I should see 3 posts

  Scenario: Every post on home page should have Read more.. button
    Given I am an visitor and there is 3 posts
    When I visit home page
    Then I should see 3 'Read more...' link

  Scenario: When user click on 'Read more...' button should be redirected to post page
    Given I am an visitor and there is 1 posts
    When I visit home page
    And I click Read more... link
    Then I should see post title
    And I should see post body

  Scenario: As a visitor when user visit own post it should not be able to edit and destroy post
    Given I am an visitor and there is 1 posts
    When I visit home page
    And I click Read more... link
    Then I should not see 'Edit' link
    And I should not see 'Destroy' link

  Scenario: As a loged in user when user visit own post it should be able to edit and destroy post
    Given I am an loged in user and there is 1 posts
    When I visit home page
    And I click Read more... link
    Then I should see 1 'Edit' link
    And I should see 1 'Destroy' link

  Scenario: As a loged in user when user visit other post it should not be able to edit and destroy post
    Given I am an loged in user and there is 1 other posts
    When I visit home page
    And I click Read more... link
    Then I should not see 1 'Edit' link
    And I should not see 1 'Destroy' link

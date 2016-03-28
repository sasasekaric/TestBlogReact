Feature: Reactive App

  @javascript
  Scenario: When user visits Reactive App link
    Given I am an visitor and there is 3 posts
    When I visit home page
    And I click Reactive App link
    Then I should see 3 posts on the page

  @javascript
  Scenario: When user clicks on Read more... on Reactive page
    Given I am an visitor and there is 1 posts
    When I visit home page
    And I click Reactive App link
    And I click Read more... link
    Then I should see 1 posts on the page with full body

  @javascript
  Scenario: When user clicks on Back to posts on show post page
    Given I am an visitor and there is 1 posts
    When I visit home page
    And I click Reactive App link
    And I click Read more... link
    And I click Back to Posts link
    Then I should see 1 posts on the page

  @javascript
  Scenario: When user search posts
    Given I am an visitor and there is 10 posts
    When I visit home page
    And I click Reactive App link
    And I type post 3 title in search bar
    Then I should see matched post on the page

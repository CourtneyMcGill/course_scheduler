Feature: Update existing product
  As the toy store manager,
  so that I can get rid of requirements,
  I want to be able to delete requirements.

  Background: the toy story has several products
    Given these requirements:
      | name         |  course     |
      | History      |  10287      |
      | Biology      |  10001      |            
      | Geology      |  101287     | 

  Scenario: Delete a requirement
    Given I am on the requirements page
    When I press "Biology"
    Then I should see "10001"
    When I press "Delete requirement"
    Then I should be on the requirements page
    And I should see "History"
    And I should see "Geology"
    And I should see "10287"
    And I should not see "Biology"
    And I should not see "10001"

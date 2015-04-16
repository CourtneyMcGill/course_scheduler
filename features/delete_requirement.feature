Feature: Delete existing requirement
  As the administrator,
  so that I can get rid of requirements that no longer exist,
  I want to be able to delete requirements.

  Background: there are several requirements
  Given these requirements:
      | name         |  course     |
      | History      |  10287      |
      | Biology      |  10001      |            
      | Geology      |  10127      | 

  Scenario: Edit a requirement
    Given I am on the requirements page
    When I press "Geology"
    Then I should see "10127"
    When I press "Delete requirement"
    Then I should be on the requirements page
    And I should see "10287"
    And I should see "10001"
    And I should see "Geology requirement sucessfully deleted"
    And I should not see "Geology"

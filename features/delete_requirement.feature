Feature: Delete existing requirement
  As the administrator,
  so that I can get rid of requirements that no longer exist,
  I want to be able to delete requirements.

  Background: there are several requirements
  Given these requirements:
      | name         |
      | History      |
      | Biology      |          
      | Geology      |

  Scenario: Edit a requirement
    Given I am on the requirements page
    When I press "Geology"
    When I press "delete"
    Then I should be on the requirements page
    And I should not see "geology"

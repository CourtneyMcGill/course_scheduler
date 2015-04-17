Feature: Update existing requirement
  As the administrator,
  so that I keep my requirement information up to date,
  I want to be able to update requirement information.

  Background: there are several requirements
  Given these requirements:
      | name         |  course     |
      | History      |  10287      |
      | Biology      |  10001      |            
      | Geology      |  10128      | 
      | French       |  12345      |

  Scenario: Edit a requirement
    Given I am on the requirements page
    When I press "French"
    When I press "Edit requirement"
    And I fill in "Course" with "10288"
    And I press "Update Requirement"
    And I should see "French successfully updated"
    And I press "Back to requirement list"
    Then I should be on the requirements page
    And I should see "10288"
    And I should not see "12345"

Feature: Update existing requirement
  As the administrator,
  so that I keep my requirement information up to date,
  I want to be able to update requirement information.

  Background: there are several requirements
  Given these requirements:
      | name         |  course     |
      | History      |  10287      |
      | Biology      |  10001      |            
      | Geology      |  101287     | 

  Scenario: Edit a requirement
    Given I am on the requirements page
    When I press "History"
    Then I should see "10287"
    When I press "Edit requirement"
    And I fill in "Course" with "10286"
    And I press "Update Requirement"
    Then I should see "10286"
    And I should see "History successfully updated"
    And I should not see "10287"

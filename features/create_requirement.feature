Feature: Create new requirement
  As an administrator
  So that I can ensure students meet graduation requirements
  I want to be able to create majors and course requirements for them

  Background: the toy story has several requirements
    Given these requirements:
      | name         |
      | Geology      |
      | Biology      |

  Scenario: Create a new requirement
    Given I am on the create new requirement page
    When I fill in the following:
      | Name        | Religion        |
    And I press "Create Requirement"
    Then I should be on the requirements page
    And I should see "Religion"
    And I should see "New requiremenent Religion created successfully"


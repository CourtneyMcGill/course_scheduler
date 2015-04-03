Feature: Create new requirement
  As an administrator
  So that I can ensure students meet graduation requirements
  I want to be able to create majors and course requirements for them

  Background: the toy story has several requirements
    Given these requirements:
      | name         | course | 
      | Geology      | 10120  |
      | Biology      | 10001  |

  Scenario: Create a new requirement
    Given I am on the create new requirements page
    When I fill in the following:
      | Name        | Religion        |
      | Course      | 10545           |
    And I press "Create Requirement"
    Then I should be on the requiremets page
    And I should see that "religion" has a course of "10545"

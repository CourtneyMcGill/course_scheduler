Feature: Add and remove course to/from requirement
  As an admin,
  So that students know what courses they need to take,
  I want to be able to add courses to a requirement.
  
  Background: there are several requirements
  Given these requirements:
      | name         |
      | History      |
      | Biology      |        
      | Geology      |
      | French       |

  Scenario: add course to requirement
    Given I am on the requirements page
    When I press "French"
    And I press "Add to French"
    Then I should see "added to French"
    When I press "Done adding courses to requirement"
    And I press "Back to Majors list"
    Then I should be on the requirements page


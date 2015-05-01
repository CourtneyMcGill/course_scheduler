Feature: Search for Requirement by name
  As the administrator,
  so that I can find a specific requirement,
  I want to be able to search for requirements by name

  Background: there are several requirements
  Given these requirements:
      | name         |  course     |
      | History      |  10287      |
      | Biology      |  10001      |            
      | Geology      |  10128      | 
      | French       |  12345      |


  Scenario: search by Requirement name
    When I go to the requirements page
    And I fill in "Requirements search" with "Biology"
    And I press "Find requirements"
    Then I should be on the requirements page
    And I should see "Biology"

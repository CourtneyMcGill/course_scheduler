Feature: Delete existing course
  As the administrator,
  so that I can get rid of courses that will no longer be offered,
  I want to be able to delete courses.

  Background: there are several courses
    Given these courses:
      | crn | course_name | title | instructor | days | starts | ends | building_room | credits|
      | 10003 | COSC_480 | Cloud Computing | Sommers | MWF | 1020 | 1110 | Lawrence 105 | 1 |
      | 11143 | SOCI_324 | Women, Health, and Medicine | Loe | MWF | 245 | 4 | Alana Sem. room | 1 |

      
  Scenario: Delete a course
    Given I am on the courses page
    When I press "SOCI_324"
    Then I should see "Women, Health, and Medicine"
    When I press "Delete"
    Then I should be on the courses page
    And I should see "Cloud Computing"
    And I should see "10003"
    And I should see "Course- Women, Health, and Medicine deleted"
    And I should not see "SOCI_324"
    And I should not see "11143"


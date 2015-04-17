Feature: Search for course by crn
  As the administrator,
  so that I can find a specific course,
  I want to be able to search for courses by CRN

  Background: there are several courses
    Given these courses:
      | crn | course_name | title | instructor | days | starts | ends | building_room | credits|
      | 10003 | COSC_480 | Cloud Computing | Sommers | MWF | 1020 | 1110 | Lawrence 105 | 1 |
      | 11143 | SOCI_324 | Women, Health, and Medicine | Loe | MWF | 245 | 4 | Alana Sem. room | 1 |

  Scenario: search by CRN
    When I go to the courses page
    And I fill in "Crn search" with "10003"
    And I press "Find courses"
    Then I should be on the courses page
    And I should see "Cloud Computing"

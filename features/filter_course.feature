Feature: Filter courses by start and end time
  As the administrator,
  so that I can find courses offered at certain times
  I want to be able to filter by course time

  Background: there are several courses
    Given these courses:
      | crn | course_name | title | instructor | days | starts | ends | building_room | credits|
      | 10003 | MATH_323 | Abstraact Algebra | Saracino | MWF | 1020 | 1120 | McGregory 205 | 1 |
      | 10001 | COSC_320 | Algorithms | Stratton | MWF | 1120 | 1220 | McGregory 105 | 1 |
      | 10002 | COSC_480 | Cloud Computing | Sommers | MWF | 1320 | 1435 | Lawrence 105 | 1 |

  Scenario: filter courses by start time
    When I go to the courses page
    And I fill in "filter[before]" with "1200"
    And I press "Filter courses"
    Then I should be on the courses page
    And I should see "Abstract Algebra"
    And I should not see "Algorithms"

  Scenario: filter courses by end time
    When I go to the courses page
    And I fill in "filter[after]" with "1215"
    And I press "Filter courses"
    Then I should be on the courses page
    And I should see "Cloud Computing"
    And I should not see "Algoritims"

  Scenario: filter courses by start and end time
    When I go to the courses page
    And I fill in "filter[before]" with "1300"
    And I fill in "filter[after]" with "1110"
    And I press "Filter courses"
    Then I should be on the courses page
    And I should see "Algorithms"
    And I should not see "Cloud Computing"
    And I should not see "Abstract Algebra"


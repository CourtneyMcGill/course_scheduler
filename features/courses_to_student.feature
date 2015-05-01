Feature: Add and remove course to/from schedule
  As a student,
  So that I can take the classes I want to take,
  I want to be able to add myself to a course.

  Background: the planner students page has several courses
    Given these courses:
      | crn | course_name | instructor | days | begin | end |
      | 10005 | COSC_480 | Sommers | MWF | 1020 | 1110 |

  Scenario: Add/remove class to schedule
    Given I am on the planner students page
    When I press "Add to plans"
    Then I should see "Added your plan"
    And I should see "10005"
    And I should see "Added your plan"
    When I press "Remove from planner"
    Then I should be on the planner students page
    And I should see "Removed your plan!"


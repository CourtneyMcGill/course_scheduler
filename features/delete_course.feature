Feature: Delete existing course
  As a website admin,
  So that I can get rid of courses,
  I want to be able to delete courses

  Background: the course page has several courses
    Given these courses:
          Given these requirements:
      | course name   | title             | instructor    | days      | starts    | ends  |
      | COSC_480      | Cloud Computing   | Sommers       | MWF       | 1020      | 1110  |
      | COSC_465      | Computer Networks | Vijay         | TR        | 955       | 1120  |

  Scenario: Delete a course
    Given I am on the courses page
    When I press "COSC_480"
    Then I should see "Cloud Computing"
    And I should see "Sommers"
    And I should see "MWF"
    And I should see "1020"
    And I should see "1110"
    When I press "Delete course"
    Then I should be on the requirements page
    And I should see "COSC_465"
    And I should not see "COSC_480"
    And I should not see "Cloud Computing"
    And I should not see "Sommers"
    And I should not see "MWF"
    And I should not see "1020"
    And I should not see "1110"

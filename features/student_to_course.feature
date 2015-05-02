Feature: Add and remove student to/from course
  As an admin,
  So that students can enroll in classes,
  I want to be able to add students to a course.

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | Caroline     | Davidson    | 823356789 | 2015 |
      | Cat          | Chen        | 621459737 | 2017 |
      | Katy         | Welp        | 343242141 | 2018 |

 Scenario: Add/remove a student from a class
    Given I am on the students page
    When I press "Caroline"
    And I press "Add Student to courses"
    And I press "Add Caroline"
    Then I should see "Caroline added to"
    When I press "Done adding student to courses"
    And I press "Remove"
    Then I should see "Caroline removed from"
    And I press "Back to students list"
    Then I should be on the students page


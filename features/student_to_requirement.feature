Feature: Add student to requirement
  As an admin,
  So that students can declare their major,
  I want to be able to add students to a requirement.

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | Caroline     | Davidson    | 823356789 | 2015 |
      | Cat          | Chen        | 621459737 | 2017 |
      | Katy         | Welp        | 343242141 | 2018 |

 Scenario: Create a new student
    Given I am on the students page
    When I press "Cat"
    And I press "Add Student to requirements"
    And I press "Add Cat"
    Then I should see "Cat added to"
    When I press "Done adding courses to requirement"
    When I press "Remove"
    Then I should see "Cat removed from"
    And I press "Back to students list"
    Then I should be on the students page



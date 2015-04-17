Feature: Search for students by ID
  As the administrator,
  so that I can find a specific student,
  I want to be able to search for students

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | Courtney     | McGill      | 000896274 | 2016 |
      | Tom          | Wheeler     | 000456987 | 2017 |
      | Dan          | Miller      | 220853945 | 2015 |

  Scenario: search by student id
    When I go to the students page
    And I fill in "Student search by id number" with "000896274"
    And I press "Find Students"
    Then I should be on the students page
    And I should see "Courtney"

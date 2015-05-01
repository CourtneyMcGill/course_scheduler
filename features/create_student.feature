Feature: Create new student
  As the administrator,
  so that I can have more than one student,
  I want to be able to add new students.

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | howard       | stern       | 123456789 | 2016 |
      | pedro        | martinez    | 321456987 | 2017 |
      | tom          | izzo        | 333222111 | 2015 |

  Scenario: Create a new student
    Given I am on the create new student page
    When I fill in the following:
      | First   | James        |
      | Last    | Harden       |
      | Sid     | 888888888    |
      | Major   | COSC         |
    And I press "Submit New Student"
    Then I should be on the students page
    And I should see "Student James successfully created"
    And I should see "James"
    And I should see "Harden"
    And I should see "COSC"


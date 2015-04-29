Feature: Delete existing student
  As the admin,
  so that I can get rid of records of people that are no longer students at Colgate,
  I want to be able to delete students.

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | Howard       | Stern       | 123456789 | 2016 |
      | Pedro        | Martinez    | 321456987 | 2017 |
      | Tom          | Izzo        | 333222111 | 2015 |

  Scenario: Delete a student
    Given I am on the students page
    When I press "Pedro"
    Then I should see "321456987"
    When I press "delete"
    Then I should be on the students page
    And I should see "123456789"
    And I should see "333222111"
    And I should not see "321456987"

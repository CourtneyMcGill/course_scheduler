Feature: Update existing student
  As the admin,
  so that I keep my student information up to date,
  I want to be able to update student information.

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | howard       | stern       | 123456789 | 2016 |
      | pedro        | martinez    | 321456987 | 2017 |
      | tom          | izzo        | 333222111 | 2015 |

  Scenario: Create a new student
    Given I am on the students page
    When I press "howard"
    Then I should see "howard"
    And I should see "stern"
    And I should see "123456789"
    And I should see "2016"
    When I press "Edit Student details"
    And I fill in "Last" with "dean"
    And I fill in "Sid" with "987654321"
    And I fill in "Year" with "2018"
    And I press "Update Student"
    And I should see "987654321"
    And I should see "2018"
    And I should see "howard was successfully updated"

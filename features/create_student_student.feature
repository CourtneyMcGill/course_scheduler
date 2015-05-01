Feature: Create new student
  As a student,
  so that I can plan a schedule,
  I want to be able to add a new student.

  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | Caroline     | Davidson    | 823356789 | 2015 |
      | Cat          | Chen        | 621459737 | 2017 |
      | Katy         | Welp        | 343242141 | 2018 |

  Scenario: Create a new student
    Given I am on the create new student page
    When I fill in the following:
      | First   | Gracie        |
      | Last    | Rentschler    |
      | Sid     | 123456789     |
      | Major   | CHIN          |

    And I press "Submit New Student"
    Then I should be on the students page
    And I should see "Student James successfully created"
    And I should see "James"
    And I should see "Harden"
    And I should see "COSC"

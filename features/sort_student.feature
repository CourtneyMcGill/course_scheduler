Feature: Sort Courses
  As an admin,
  So that I can view students in a certain order,
  I want to be able to sort students.

  
  Background: there are several students
    Given these Students:
      | first        |    last     |    sid    | year |
      | Howard       | Stern       | 123456789 | 2016 |
      | Pedro        | Martinez    | 321456987 | 2017 |
      | Tom          | Izzo        | 333222111 | 2015 |

    Scenario: sort courses by Last name
      Given I am on the students page
      When I press "Last"
      Then I should be on the students page
      And I should see "Izzo" before "Martinez"
      And I should see "Martinez" before "Stern"


    Scenario: sort courses by First name
      Given I am on the students page
      When I press "First"
      Then I should be on the students page
      And I should see "Howard" before "Pedro"
      And I should see "Pedro" before "Tom"

    Scenario: sort courses by student ID
      Given I am on the students page
      When I press "ID"
      Then I should be on the students page
      And I should see "123456789" before "321456987"
      And I should see "321456987" before "333222111"

    Scenario: sort courses by year
      Given I am on the students page
      When I press "Year"
      Then I should be on the students page
      And I should see "2015" before "2016"
      And I should see "2016" before "2017"








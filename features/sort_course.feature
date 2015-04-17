Feature: Sort Courses
  As an admin,
  So that I can view courses in a certain order,
  I want to be able to sort courses.

  Background: there are several courses
    Given these courses:
      | crn | course_name | title | instructor | days | starts | ends | building_room | credits|
      | 10003 | MATH_323 | Abstraact Algebra | Saracino | MWF | 1020 | 1120 | McGregory 205 | 1 |
      | 10001 | COSC_320 | Algorithms | Stratton | MWF | 1120 | 1220 | McGregory 105 | 1 |
      | 10002 | COSC_480 | Cloud Computing | Sommers | MWF | 1320 | 1435 | Lawrence 105 | 1 |
      

      
    Scenario: sort courses by CRN
      Given I am on the courses page
      When I press "CRN"
      Then I should be on the courses page
      And I should see "10001" before "10002"
      And I should see "10002" before "10003"

    Scenario: sort courses by Course Name
      Given I am on the courses page
      When I press "Course Name"
      Then I should be on the courses page
      And I should see "COSC_320" before "COSC_480"
      And I should see "COSC_480" before "MATH_323"

    Scenario: sort courses by Title
      Given I am on the courses page
      When I press "Title"
      Then I should be on the courses page
      And I should see "Abstraact Algebra" before "Algorithms"
      And I should see "Algorithms" before "Cloud Computing"

    Scenario: sort courses by Instructor
      Given I am on the courses page
      When I press "Instructor"
      Then I should be on the courses page
      And I should see "Saracino" before "Sommers"
      And I should see "Sommers" before "Stratton"

    Scenario: sort courses by Start time
      Given I am on the courses page
      When I press "Starts"
      Then I should be on the courses page
      And I should see "1020" before "1120"
      And I should see "1120" before "1320"

    Scenario: sort courses by End time
      Given I am on the courses page
      When I press "Ends"
      Then I should be on the courses page
      And I should see "1120" before "1220"
      And I should see "1220" before "1435"

    Scenario: sort courses by Building/room
      Given I am on the courses page
      When I press "Building/Room"
      Then I should be on the courses page
      And I should see "Lawrence 105" before "McGregory 105"
      And I should see "McGregory 105" before "McGregory 205"

    Scenario: sort courses by Credits
      Given I am on the courses page
      When I press "Credits"
      Then I should be on the courses page
      And I should see "1.0"





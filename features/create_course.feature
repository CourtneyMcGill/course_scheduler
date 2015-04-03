Feature: Create new course
  As a website admin,
  So that I can ensure the list of course offerings is complete,
  I want to be able to create a course.

  Background: the course page has several courses
    Given these courses:
      | crn | course_name | title | instructor | days | starts | ends | building_room | credits|
      | 10005 | COSC_480 | Cloud Computing | Sommers | MWF | 1020 | 1110 | Lawrence 105 | 1 |

  Scenario: Create a new course
    Given I am on the create new course page
    When I fill in the following:
      | Crn             | 10006             |
      | Course name     | COSC_465          |
      | Title           | Computer Networks |
      | Instructor      | Stratton          |
      | Days            | TR                |
      | Starts          | 955               |
      | Ends            | 1120              |
      | Building room   | Lawrence 200      |
      | Credits         | 1                 |
      | Coreq           | COSC_465_Lab      |
      | Crosslist       | none              |
      | Restrictions    | none              |
      | Prereq          | COSC_301          |
      | Notes           | difficult         |
    And I press "Create Course"
    Then I should be on the courses page
    And I should see "Course Computer Networks successfully created"
    And I should see "COSC_465"
    And I should see "Computer Networks"
    And I should see "Stratton"
    And I should see "TR"
    And I should see "955"
    And I should see "1120"
    And I should see "Lawrence 200"
    And I should see "1"

Feature: Create new course
  As a website admin,
  So that I can ensure the list of course offerings is complete,
  I want to be able to create a course.

  Background: the course page has several courses
    Given these requirements:
      | crn     | course name   | title             | instructor    | days      | starts    | ends  | building/room     | credits   |
      | 10005   | COSC_480      | Cloud Computing   | Sommers       | MWF       | 1020      | 1110  | Lawrence 105      | 1         |

  Scenario: Create a new course
    Given I am on the create new course page
    When I fill in the following:
      | CRN             | 10006             |
      | Course          | COSC_465          |
      | Title           | Computer Networks |
      | Instructor      | Stratton          |
      | Days            | TR                |
      | Starts          | 955               |
      | Ends            | 1120              |
      | Building/Room   | Lawrence 200      |
      | Credits         | 1                 |
    And I press "Create Course"
    Then I should be on the courses page
    And I should see "New course Computer Networks successfully createsd"
    And I should see that "10006" has a course name of "COSC_465"
    And I should see that "10006" has a title of "Computer Networks"
    And I should see that "10006" has an instructor of "Stratton"
    And I should see that "10006" has a days of "TR"
    And I should see that "10006" has a starts of "955"
    And I should see that "10006" has an ends of "1120"
    And I should see that "10006" has a building/room of "Lawrence 200"
    And I should see that "10006" has a credits of "1"

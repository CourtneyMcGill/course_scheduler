Feature: Edit and update course information
  As the admin,
  So I can keep the registrar updated,
  I want to be able to edit course information

  Background: there are several courses
    Given these courses:
      | crn   | dept | level | course_name | title             | instructor | days | starts | ends | building_room | credits|
      | 10003 | COSC | 480   | COSC_480    | Cloud Computing   | Sommers    | MWF  | 1020   | 1110 | Lawrence 105  | 1.0    |
      | 10002 | COSC | 320   | COSC_320    | Algorithms        | Stratton   | TR   | 1320   | 1435 | McGregory 205 | 1.0    |
      | 10001 | MATH | 323   | MATH_323    | Abstraact Algebra | Saracino   | MWF  | 1120   | 1210 | McGregory 105 | 1.0    |


      
    Scenario: Edit a course
      Given I am on the courses page
      When I press "COSC_480"
      Then I should see "Cloud Computing"
      And I should see "Sommers"
      And I should see "MWF"
      And I should see "1020"
      And I should see "1110"
      When I press "Edit the existing course"
      And I fill in title with "Networks"
      And I fill in instructor with "Vijay"
      And I press "Update Course"
      And I should see "Networks was successfully updated"
      And I should see "Vijay"


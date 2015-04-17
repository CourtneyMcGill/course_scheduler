
Feature: Update existing course
  As a website admin,
  So that I can keep my course information up to date,
  I want to be able to update course information.

  Background: there are several courses
    Given these courses:
      | crn | course_name | title | instructor | days | starts | ends | building_room | credits|
      | 10003 | COSC_480 | Cloud Computing | Sommers | MWF | 1020 | 1110 | Lawrence 105 | 1 |
      
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

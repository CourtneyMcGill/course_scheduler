Feature: Update existing course
  As a website admin,
  So that I can keep my course information up to date,
  I want to be able to update course information.

  Background: there are several courses
    Given these requirements:
      | course name   | title             | instructor    | days      | starts    | ends  |
      | COSC_480      | Cloud Computing   | Sommers       | MWF       | 1020      | 1110  |
      
    Scenario: Edit a course
      Given I am on the courses page
      When I press "COSC_480"
      Then I should see "Cloud Computing"
      And I should see "Sommers"
      And I should see "MWF"
      And I should see "1020"
      And I should see "1110"
      When I press "Edit the existing course"
      And I fill in title with "Computer Networks"
      And I fill in instructor with "Vijay"
      And I press "Update Course"
      Then I should see "Computer Networks"
      And I should see "Vijay"


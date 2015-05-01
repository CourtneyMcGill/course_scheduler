#TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file was generated by Cucumber-Rails and is only here to get you a head start
# These step definitions are thin wrappers around the Capybara/Webrat API that lets you
# visit pages, interact with widgets and make assertions about page content.
#
# If you use these step definitions as basis for your features you will quickly end up
# with features that are:
#
# * Hard to maintain
# * Verbose to read
#
# A much better approach is to write your own higher level step definitions, following
# the advice in the following blog posts:
#
# * http://benmabey.com/2008/05/19/imperative-vs-declarative-scenarios-in-user-stories.html
# * http://dannorth.net/2011/01/31/whose-domain-is-it-anyway/
# * http://elabs.se/blog/15-you-re-cuking-it-wrong
#

Given /^these requirements:$/i do |table|
  table.hashes.each do |fhash|
    Requirement.create!(fhash)
  end
end

Given /^these students:$/i do |table|
  table.hashes.each do |fhash|
    Student.create!(fhash)
  end
end

Given(/^these Courses:$/) do |table|
  table.hashes.each do |fhash|
    Course.create!(fhash)
  end
end


Given /^(?:|I )am on (.+)$/ do |page_name|
  if page_name == "the create new requirement page"
    page_name = "the new requirement page"
  end
  if page_name == "the create new course page"
    page_name  = "the new course page"
  end
  if page_name == "the create new student page"
    page_name = "the new student page"
  end
  visit path_to(page_name)
end



require 'uri'
require 'cgi'
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "paths"))
require File.expand_path(File.join(File.dirname(__FILE__), "..", "support", "selectors"))

module WithinHelpers
  def with_scope(locator)
    locator ? within(*selector_for(locator)) { yield } : yield
  end
end
World(WithinHelpers)

# Single-line step scoper
When /^(.*) within (.*[^:])$/ do |step, parent|
  with_scope(parent) { When step }
end

# Multi-line step scoper
When /^(.*) within (.*[^:]):$/ do |step, parent, table_or_string|
  with_scope(parent) { When "#{step}:", table_or_string }
end

When /^(?:|I )go to (.+)$/ do |page_name|
  visit path_to(page_name)
end

When /^(?:|I )press "([^"]*)"$/ do |button|
  click_on(button)
end

When /^(?:|I )follow "([^"]*)"$/ do |link|
  click_link(link)
end

When /^(?:|I )fill in "([^"]*)" with "([^"]*)"$/ do |field, value|
  fill_in(field, :with => value)
end

When /^(?:|I )fill in "([^"]*)" for "([^"]*)"$/ do |value, field|
  fill_in(field, :with => value)
end

# Use this to fill in an entire form with data from a table. Example:
#
#   When I fill in the following:
#     | Account Number | 5002       |
#     | Expiry date    | 2009-11-01 |
#     | Note           | Nice guy   |
#     | Wants Email?   |            |
#
# TODO: Add support for checkbox, select or option
# based on naming conventions.
#
When /^(?:|I )fill in the following:$/ do |fields|
  fields.rows_hash.each do |name, value|
    When %{I fill in "#{name}" with "#{value}"}
  end
end

When /^(?:|I )select "([^"]*)" from "([^"]*)"$/ do |value, field|
  select(value, :from => field)
end

When /^(?:|I )check "([^"]*)"$/ do |field|
  check(field)
end

When /^(?:|I )uncheck "([^"]*)"$/ do |field|
  uncheck(field)
end

When /^(?:|I )choose "([^"]*)"$/ do |field|
  choose(field)
end

When /^(?:|I )attach the file "([^"]*)" to "([^"]*)"$/ do |path, field|
  attach_file(field, File.expand_path(path))
end

Then /^I should see that "(.*?)" has a course of "(.*?)"$/ do |req, course|
  rows=page.all('tr.data')
  rows.each do |row|
    if(row.find('td.productname').has_text?toy)
      tPrice=row.find('td.price').text
      tPrice.should==price
    end
  end
end

Then /^I should see that "(.*?)" has an image "(.*?)"$/ do |toy, image|
  rows=page.all('tr.data')
  rows.each do |row|
    if(row.find('td.productname').has_text?toy)
      expect(row.find('td.image')).to have_css("img[src*='#{image}']")
    end
  end
end

Then /^I should see the image "(.*?)"$/ do |image|
  expect(page).to have_css("img[src*='#{image}']")
end

Then /^(?:|I )should see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_content(text)
  else
    assert page.has_content?(text)
  end
end

Given /^these courses:$/ do |table|
  table.hashes.each do |fhash|
    Course.create!(fhash)
  end

end

Then /^I should see that "(.*?)" has a last of "(.*?)"$/ do |first, last|
  firsts,lasts = [],[]
  page.all('.first').each { |f| firsts << f.text }
  page.all('.last').each { |l| lasts << l.text }
  i = firsts.index(first)
  lasts[i-1].should eq last
end

Then /^I should see that "(.*?)" has a sid of "(.*?)"$/ do |first, sid|
  firsts,sids = [],[]
  page.all('.first').each { |f| firsts << f.text }
  page.all('.sid').each { |s| sids << s.text }
  i = firsts.index(first)
  sids[i-1].should eq sid
end

Then /^I should see that "(.*?)" has a major of "(.*?)"$/ do |first, major|
  firsts,majors = [],[]
  page.all('.first').each { |f| firsts << f.text }
  page.all('.major').each { |m| majors << m.text }
  i = firsts.index(first)
  majors[i-1].should eq major
end

Then /^I should see that "(.*?)" has a year of "(.*?)"$/ do |first, year|
  firsts,years = [],[]
  page.all('.first').each { |f| firsts << f.text }
  page.all('.year').each { |y| years << y.text }
  i = firsts.index(first)
  years[i-1].should eq year
end

Then /^I should see student last in sorted order$/ do
  names = []
  page.all('.first').each { |n| names << n.text }
  names.delete_at(0)
  sorted_names = names.sort
  names.should eq sorted_names
end

Then /^I should see "(.*?)" before "(.*?)"$/ do |arg1, arg2|
  idx_one = page.body.index(arg1)
  idx_two = page.body.index(arg2)
  idx_one < idx_two
end


Then /^I should see student year in sorted order$/ do
  years = []
  page.all('.year').each { |y| years << y.text }
  names.delete_at(0)
  sorted_years = years.sort
  years.should eq sorted_years
end

When /^I fill in title with "(.*?)"$/ do |arg1|
  fill_in("course_title", :with => arg1)
end

When /^I fill in instructor with "(.*?)"$/ do |arg1|
  fill_in("Instructor", :with => arg1)
end



Then /^(?:|I )should see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)
  if page.respond_to? :should
    page.should have_xpath('//*', :text => regexp)
  else
    assert page.has_xpath?('//*', :text => regexp)
  end
end

Then /^(?:|I )should not see "([^"]*)"$/ do |text|
  if page.respond_to? :should
    page.should have_no_content(text)
  else
    assert page.has_no_content?(text)
  end
end

Then /^(?:|I )should not see \/([^\/]*)\/$/ do |regexp|
  regexp = Regexp.new(regexp)

  if page.respond_to? :should
    page.should have_no_xpath('//*', :text => regexp)
  else
    assert page.has_no_xpath?('//*', :text => regexp)
  end
end

Then /^the "([^"]*)" field(?: within (.*))? should contain "([^"]*)"$/ do |field, parent, value|
  with_scope(parent) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should
      field_value.should =~ /#{value}/
    else
      assert_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" field(?: within (.*))? should not contain "([^"]*)"$/ do |field, parent, value|
  with_scope(parent) do
    field = find_field(field)
    field_value = (field.tag_name == 'textarea') ? field.text : field.value
    if field_value.respond_to? :should_not
      field_value.should_not =~ /#{value}/
    else
      assert_no_match(/#{value}/, field_value)
    end
  end
end

Then /^the "([^"]*)" field should have the error "([^"]*)"$/ do |field, error_message|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')

  form_for_input = element.find(:xpath, 'ancestor::form[1]')
  using_formtastic = form_for_input[:class].include?('formtastic')
  error_class = using_formtastic ? 'error' : 'field_with_errors'

  if classes.respond_to? :should
    classes.should include(error_class)
  else
    assert classes.include?(error_class)
  end

  if page.respond_to?(:should)
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      error_paragraph.should have_content(error_message)
    else
      page.should have_content("#{field.titlecase} #{error_message}")
    end
  else
    if using_formtastic
      error_paragraph = element.find(:xpath, '../*[@class="inline-errors"][1]')
      assert error_paragraph.has_content?(error_message)
    else
      assert page.has_content?("#{field.titlecase} #{error_message}")
    end
  end
end

Then /^the "([^"]*)" field should have no error$/ do |field|
  element = find_field(field)
  classes = element.find(:xpath, '..')[:class].split(' ')
  if classes.respond_to? :should
    classes.should_not include('field_with_errors')
    classes.should_not include('error')
  else
    assert !classes.include?('field_with_errors')
    assert !classes.include?('error')
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_true
    else
      assert field_checked
    end
  end
end

Then /^the "([^"]*)" checkbox(?: within (.*))? should not be checked$/ do |label, parent|
  with_scope(parent) do
    field_checked = find_field(label)['checked']
    if field_checked.respond_to? :should
      field_checked.should be_false
    else
      assert !field_checked
    end
  end
end
 
Then /^(?:|I )should be on (.+)$/ do |page_name|
  current_path = URI.parse(current_url).path
  if current_path.respond_to? :should
    current_path.should == path_to(page_name)
  else
    assert_equal path_to(page_name), current_path
  end
end

Then /^(?:|I )should have the following query string:$/ do |expected_pairs|
  query = URI.parse(current_url).query
  actual_params = query ? CGI.parse(query) : {}
  expected_params = {}
  expected_pairs.rows_hash.each_pair{|k,v| expected_params[k] = v.split(',')} 
  
  if actual_params.respond_to? :should
    actual_params.should == expected_params
  else
    assert_equal expected_params, actual_params
  end
end

Then /^show me the page$/ do
  save_and_open_page
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Student.delete_all
Student.create!(first: "Peter", last: "McGrath", sid: "000878761", year: 2015)
Student.create!(first: "Dan", last: "Miller", sid: "123456789", year: 2015)
Student.create!(first: "Courtney", last: "McGill", sid: "789123654", year: 2016)
Student.create!(first: "Tom", last: "Wheeler", sid: "192837465", year: 2016)




Requirement.delete_all

Requirement.create!(name: "Computer Science")
Requirement.create!(name: "Sociology")
Requirement.create!(name: "Geology")
Requirement.create!(name: "Women's Studies")
Requirement.create!(name: "Biology")
Requirement.create!(name: "Hisory")

Course.delete_all

Course.create!(crn: 10111, course_name: "COSC_480", title: "Cloud Computing", instructor: "Sommers", days: "MWF", starts: 120, ends: 235, building_room: "Lawrence 105", credits: 1.0, coreq: "COSC_480_Lab", crosslist: "none", restrictions: "none", prereq: "COSC_301", notes: "kinda difficult")

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Requirement.delete_all

Requirement.create!(name: "Computer Science", course: 10091)
Requirement.create!(name: "Sociology", course: 10387)
Requirement.create!(name: "Geology", course: 10120)
Requirement.create!(name: "Women's Studies", course: 10550)
Requirement.create!(name: "Biology", course: 10001)
Requirement.create!(name: "Hisory", course: 10287)

Course.delete_all

Course.create!(crn: 10111, course_name: "COSC_480", title: "Cloud Computing", instructor: "Sommers", days: "MWF", starts: 120, ends: 235, building_room: "Lawrence 105", credits: 1.0, coreq: "COSC_480_Lab", crosslist: "none", restrictions: "none", prereq: "COSC_301", notes: "kinda difficult")

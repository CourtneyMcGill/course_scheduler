# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Course.delete_all

Course.create!(crn: 10111, course_name: "COSC_480", title: "Cloud Computing", instructor: "Sommers", days: "MWF", starts: 120, ends: 235, building_room: "Lawrence 105", credits: 1.0, coreq: "COSC_480_Lab", crosslist: "none", restrictions: "none", prereq: "COSC_301", notes: "kinda difficult")

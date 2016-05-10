# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


javi = User.create!(first_name: "Javi", last_name: "Navarra", email: "javina@example.com", password: "Parker7", password_confirmation: "Parker7")

javi.posts.create!([{post_title: "Today", post_date: Time.now, post_content: "Today I did this and that"}, {post_title: "Tomorrow", post_date: Time.now, post_content: "Tomorrow I will do all kinds of things"}, {post_title: "Next week", post_date: Time.now, post_content: "Next week is a whole other week"}])

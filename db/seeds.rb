# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

contacts = {"Alex": "9098638510", "Elaine": "2078414568", "Nick": "7039818974", "Charlie": "3038184974"}

g = Group.create(name: "The Midnight Riders")
contacts.each {|name, num| g.contacts << Contact.create(name: name, phone_number: num, user_id:1) }

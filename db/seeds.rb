# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.find_or_create_by(first_name: "Damien", last_name: "Roche")
Player.find_or_create_by(first_name: "Steven", last_name: "Grey")
Player.find_or_create_by(first_name: "Joe", last_name: "Guest")
Player.find_or_create_by(first_name: "Mark", last_name: "Maxwell")
Player.find_or_create_by(first_name: "Craig", last_name: "Bradley")
Player.find_or_create_by(first_name: "Paul", last_name: "Ingham")
Player.find_or_create_by(first_name: "Paul", last_name: "Moreton")
Player.find_or_create_by(first_name: "Zeljko", last_name: "Loncar")
Player.find_or_create_by(first_name: "Phil", last_name: "Vose")
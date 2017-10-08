# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'database_cleaner'
DatabaseCleaner.strategy = :transaction
DatabaseCleaner.clean
subscriber = Subscriber.create(email: "user1@test.com", winner: false)
prize = Prize.create(title: "Lavadora", description: "super buena", existences: 20, status:true)
condition = prize.conditions.create(specific: true, value: 1, after: 0, status: true)

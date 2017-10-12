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
prize = Prize.create(title: "TV 40", description: "Samsung", existences: 3, active:true)
condition = prize.conditions.create(condition_type: "S", number: 1, after_num: 0)
condition = prize.conditions.create(condition_type: "M", number: 2, after_num: 0)
condition = prize.conditions.create(condition_type: "S", number: 1, after_num: 0)

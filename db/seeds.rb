# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts '----------> Admin User Created!'
CreateAdminService.new.call

puts '----------> Users Created!'
User.create(name: 'Gustavo', email: 'gustavo@gmail.com', password: '12345678')
User.create(name: 'João', email: 'joao@gmail.com', password: '12345678')

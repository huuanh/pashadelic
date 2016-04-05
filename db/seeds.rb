# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(name: 'bri', username:'bri', email: 'bri@gmail.com', password: '123456', password_confirmation: '123456', admin: true)
User.create!(name: 'anh', username:'anh', email: 'anh@gmail.com', password: '123456', password_confirmation: '123456')

Category.create!(name: 'other', permalink: 'other')
Category.create!(name: 'sky', permalink: 'sky')
Category.create!(name: 'stress', permalink: 'stress')
Category.create!(name: 'childhood', permalink: 'childhood')

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all

20.times do |idx|
  user = User.create! \
    email: "client#{idx}@example.com",
      password: "client#{idx}client",
      password_confirmation: "client#{idx}client"
end

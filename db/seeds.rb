# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ActiveRecord::Base.transaction do
  user = User.create!(email: 'joe@example.com', password: 'password1') 
  new_user_msg = "A new user was created!"
  puts "\e[31m#{new_user_msg}\e[0m"
end

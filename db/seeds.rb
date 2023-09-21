# frozen_string_literal: true

# ActiveRecord::Base.transaction do
n_users = 1
users = []
n_users.times do |i|
  users[i] = User.create(email: Faker::Internet.email,
                         password: "p455w0rd")
end

n_posts = 1
posts = []
n_posts.times do |i|
  posts[i] = Post.create(body: Faker::ChuckNorris.fact,
                         user_id: (rand(n_users) + 1))

 # like = posts[i].likes.create
 # puts like.efm
end


# end

puts "Database seeded. It has:"
puts "#{User.count} User #{'record'.pluralize(User.count)}"
puts "#{Post.count} Post #{'record'.pluralize(User.count)}"

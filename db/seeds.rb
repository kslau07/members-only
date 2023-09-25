# frozen_string_literal: true

# User.create!(email: 's@s.com', password: "ssssss")
#
# ActiveRecord::Base.transaction do
#   n_users = 2
#   n_posts = 5
#
#   users = []
#   n_users.times do |i|
#     users[i] = User.create(email: Faker::Internet.email,
#                            password: "abcdefg")
#   end
#
#   posts = []
#   n_posts.times do |i|
#     posts[i] = Post.create(body: Faker::ChuckNorris.fact,
#                            post_author_id: (rand(n_users) + 1))
#   end
#
#   likes = []
#   n_users.times do |i|
#     n_posts.times do |j|
#       likes << Like.create(liked_user_id: (i + 1), liked_post_id: (j + 1))
#     end
#   end
# end
#
# puts "Database was seeded. It has:"
# puts "#{User.count} User #{'record'.pluralize(User.count)},"
# puts "#{Post.count} Post #{'record'.pluralize(Post.count)},"
# puts "#{Like.count} Like #{'record'.pluralize(Like.count)}"

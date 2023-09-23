# frozen_string_literal: true

# done: Show number of likes on a post
# TODO: Allow user to click "Like" which creates a new like object
# 1) Go to like controller and make sure the relevant actions are present
#    The actions are: create and destroy
# 2} Link to an action but just have it print to term
#     Figure out how to link to "create" from index

User.create!(email: 's@s.com', password: "ssssss")

ActiveRecord::Base.transaction do
  n_users = 2
  n_posts = 5

  users = []
  n_users.times do |i|
    users[i] = User.create(email: Faker::Internet.email,
                           password: "abcdefg")
  end

  posts = []
  n_posts.times do |i|
    posts[i] = Post.create(body: Faker::ChuckNorris.fact,
                           post_author_id: (rand(n_users) + 1))
  end

  likes = []
  n_users.times do |i|
    n_posts.times do |j|
      likes << Like.create(liked_user_id: (i + 1), liked_post_id: (j + 1))
    end
  end
end

puts "Database was seeded. It has:"
puts "#{User.count} User #{'record'.pluralize(User.count)},"
puts "#{Post.count} Post #{'record'.pluralize(Post.count)},"
puts "#{Like.count} Like #{'record'.pluralize(Like.count)}"

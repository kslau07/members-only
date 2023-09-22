# frozen_string_literal: true

# TODO: Show number of likes on a post
# 2. Go to post controller#index, add @likes=Like.all
# 3. Go to each individual post, query its Likes from the db

ActiveRecord::Base.transaction do
  n_users = 2
  n_posts = 5

  users = []
  n_users.times do |i|
    users[i] = User.create(email: Faker::Internet.email,
      password: "p455w0rd")
  end

  posts = []
  n_posts.times do |i|
    posts[i] = Post.create(body: Faker::ChuckNorris.fact,
      user_id: (rand(n_users) + 1))
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

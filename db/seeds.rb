# frozen_string_literal: true

ActiveRecord::Base.transaction do
  n_users = rand(5..10)
  n_posts = rand((n_users * 5)..(n_users * 10))
  n_likes = n_users * n_posts * rand(1..3)

  users = []
  n_users.times do |i|
    users[i] = User.create(email: Faker::Internet.email,
                           password: "abcdefg")
  end
    
  posts = []
  n_posts.times do |i|
    posts[i] = Post.create(body: "#{Faker::TvShows::MichaelScott.quote}",
                           post_author_id: (rand(n_users) + 1))
  end

  likes = []
  n_likes.times do |_i|
    likes << Like.create(liked_user_id: rand(n_users), liked_post_id: rand(n_posts))
  end
end

puts "Database was seeded. It has:"
puts "#{User.count} User #{'record'.pluralize(User.count)},"
puts "#{Post.count} Post #{'record'.pluralize(Post.count)},"
puts "#{Like.count} Like #{'record'.pluralize(Like.count)}"

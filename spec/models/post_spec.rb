# == Schema Information
#
# Table name: posts
#
#  id             :integer          not null, primary key
#  body           :text             not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  post_author_id :integer          not null
#
# Indexes
#
#  index_posts_on_post_author_id  (post_author_id)
#
# Foreign Keys
#
#  post_author_id  (post_author_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'creates a post associated with a user' do
    initial_count = Post.count
    post_author = FactoryBot.create(:user)
    FactoryBot.create(:post, post_author:)

    final_count = Post.count
    difference = 1
    expect(final_count - initial_count).to eq(difference)
  end
end

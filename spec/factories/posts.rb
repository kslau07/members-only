# frozen_string_literal: true

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

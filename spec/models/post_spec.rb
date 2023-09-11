# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_posts_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Post, type: :model do
  # user = User.create!(:email => 'test@example.com', :password => 'f4k3p455w0rd')
  # login_as(user, :scope => :user)

  pending "add some examples to (or delete) #{__FILE__}"

end

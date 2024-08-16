# == Schema Information
#
# Table name: post_comments
#
#  id          :integer          not null, primary key
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  consumer_id :integer          not null
#  post_id     :integer          not null
#
# Indexes
#
#  index_post_comments_on_consumer_id  (consumer_id)
#  index_post_comments_on_post_id      (post_id)
#
require "test_helper"

class PostCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

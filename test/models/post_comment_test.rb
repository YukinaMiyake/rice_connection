# == Schema Information
#
# Table name: post_comments
#
#  id          :integer          not null, primary key
#  content     :text             not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  post_id     :integer          not null
#  producer_id :integer          not null
#
# Indexes
#
#  index_post_comments_on_post_id      (post_id)
#  index_post_comments_on_producer_id  (producer_id)
#
# Foreign Keys
#
#  post_id      (post_id => posts.id)
#  producer_id  (producer_id => producers.id)
#
require "test_helper"

class PostCommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

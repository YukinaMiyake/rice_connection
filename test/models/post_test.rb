# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer          not null
#  producer_id :integer          not null
#
# Indexes
#
#  index_posts_on_item_id      (item_id)
#  index_posts_on_producer_id  (producer_id)
#
require "test_helper"

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: order_details
#
#  id         :integer          not null, primary key
#  amount     :integer          not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :integer          not null
#  order_id   :integer          not null
#
# Indexes
#
#  index_order_details_on_item_id   (item_id)
#  index_order_details_on_order_id  (order_id)
#
require "test_helper"

class OrderDetailTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

# == Schema Information
#
# Table name: cart_items
#
#  id          :integer          not null, primary key
#  amount      :integer
#  weight      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  consumer_id :integer          not null
#  item_id     :integer          not null
#
# Indexes
#
#  index_cart_items_on_consumer_id  (consumer_id)
#  index_cart_items_on_item_id      (item_id)
#
require "test_helper"

class CartItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

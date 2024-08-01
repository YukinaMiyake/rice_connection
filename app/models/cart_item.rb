class CartItem < ApplicationRecord
  belongs_to :consumer
  belongs_to :item
  
  def subtotal 
    item.with_tax_price * amount
  end
  
end

# == Schema Information
#
# Table name: cart_items
#
#  id          :integer          not null, primary key
#  amount      :integer
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
# Foreign Keys
#
#  consumer_id  (consumer_id => consumers.id)
#  item_id      (item_id => items.id)
#

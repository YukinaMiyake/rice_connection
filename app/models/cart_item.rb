class CartItem < ApplicationRecord
  belongs_to :consumer
  belongs_to :item
  
  def subtotal 
    item.with_tax_price * amount
  end
  
  def self.total
    self.all&.map { |o| o.subtotal }&.sum || 0
  end
  
  def self.item_count
    self.all&.map { |o| o.amount }&.sum || 0
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

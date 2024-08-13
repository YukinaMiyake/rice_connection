class OrderDetail < ApplicationRecord
  belongs_to :order
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

class Order < ApplicationRecord
  belongs_to :consumer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1, 発送準備中: 2, 発送済み: 3 }
  

end

# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  address        :string           not null
#  name           :string           not null
#  payment_method :integer          not null
#  postal_code    :string           not null
#  shipping_cost  :integer          not null
#  status         :integer          default("入金待ち"), not null
#  total_payment  :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  consumer_id    :integer          not null
#
# Indexes
#
#  index_orders_on_consumer_id  (consumer_id)
#

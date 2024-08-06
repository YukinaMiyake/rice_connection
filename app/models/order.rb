class Order < ApplicationRecord
  belongs_to :consumer
  has_many :order_details, dependent: :destroy
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  

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
#  status         :integer          default(0), not null
#  total_payment  :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  consumer_id    :integer          not null
#
# Indexes
#
#  index_orders_on_consumer_id  (consumer_id)
#

class Order < ApplicationRecord
  belongs_to :consumer
  has_many :order_details, dependent: :destroy
  
  validates :payment_method, presence: true
  validates :address, presence: true
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { 入金待ち: 0, 入金確認: 1 }
  
  scope :active_orders, -> { where.not(status: "入金待ち") }
  
  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  #after_find :detail_check
  
  # def detail_check
  #   details = self.order_details.pluck(:status)
  #   if details.size == ["発送済み"]

  #   end
  # end
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

class Item < ApplicationRecord
    
  has_many :posts, dependent: :destroy
  belongs_to :producer
  
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      "no_picture.jpg"
    else
      image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
end

# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  introduction :text
#  name         :string           not null
#  price        :integer          default(0), not null
#  status       :integer          default(0), not null
#  stock        :integer          default(0), not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  producer_id  :integer          not null
#
# Indexes
#
#  index_items_on_producer_id  (producer_id)
#

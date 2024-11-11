class Favorite < ApplicationRecord
  
  belongs_to :consumer
  belongs_to :post
  
  validates :consumer_id, uniqueness: { scope: :post_id }
  
end

# == Schema Information
#
# Table name: favorites
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  consumer_id :integer
#  post_id     :integer
#

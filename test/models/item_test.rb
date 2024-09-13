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
#  genre_id     :integer          not null
#  producer_id  :integer          not null
#
# Indexes
#
#  index_items_on_genre_id     (genre_id)
#  index_items_on_producer_id  (producer_id)
#
require "test_helper"

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

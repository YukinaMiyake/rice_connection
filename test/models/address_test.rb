# == Schema Information
#
# Table name: addresses
#
#  id          :integer          not null, primary key
#  address     :string           not null
#  name        :string           not null
#  postal_code :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  consumer_id :integer          not null
#
# Indexes
#
#  index_addresses_on_consumer_id  (consumer_id)
#
require "test_helper"

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

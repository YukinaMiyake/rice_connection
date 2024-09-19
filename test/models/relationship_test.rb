# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  status      :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  consumer_id :integer          not null
#  producer_id :integer          not null
#
# Indexes
#
#  index_relationships_on_consumer_id                  (consumer_id)
#  index_relationships_on_consumer_id_and_producer_id  (consumer_id,producer_id) UNIQUE
#  index_relationships_on_producer_id                  (producer_id)
#
require "test_helper"

class RelationshipTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

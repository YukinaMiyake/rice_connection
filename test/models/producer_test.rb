# == Schema Information
#
# Table name: producers
#
#  id                     :integer          not null, primary key
#  address                :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  first_name             :string
#  is_active              :boolean          default(TRUE), not null
#  last_name              :string
#  postal_code            :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  telephone_number       :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_producers_on_email                 (email) UNIQUE
#  index_producers_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class ProducerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end

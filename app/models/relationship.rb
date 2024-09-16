class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "Producer"
  belongs_to :followed, class_name: "Consumer"
  
end

# == Schema Information
#
# Table name: relationships
#
#  id          :integer          not null, primary key
#  status      :boolean          default(TRUE), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  followed_id :integer          not null
#  follower_id :integer          not null
#
# Indexes
#
#  index_relationships_on_followed_id  (followed_id)
#  index_relationships_on_follower_id  (follower_id)
#

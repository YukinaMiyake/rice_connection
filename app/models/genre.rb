class Genre < ApplicationRecord
  has_many :items, dependent: :destroy
  
  validates :name, presence: true, uniqueness: { message: 'はすでに登録されています' }
  
end

# == Schema Information
#
# Table name: genres
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

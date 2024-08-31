class Consumer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders, dependent: :destroy
  
  has_one_attached :profile_image
  
  def get_profile_image(width, height)
    unless profile_image.attached?
      "no_image.jpg"
    else
      profile_image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
  def name
    "#{last_name}　#{first_name}"
  end
  
  
  def active_for_authentication?
    super && (self.is_active == true)
  end
  
end

# == Schema Information
#
# Table name: consumers
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
#  index_consumers_on_email                 (email) UNIQUE
#  index_consumers_on_reset_password_token  (reset_password_token) UNIQUE
#

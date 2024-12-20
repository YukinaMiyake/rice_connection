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
  has_many :relationships, dependent: :destroy
  has_many :producers, through: :relationships
  has_many :favorites, dependent: :destroy
  
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :email, presence: true
  #validates :postal_code, presence: true, length: { maximum: 7, minimum: 7 }, numericality: true
  #validates :address, presence: true
  #validates :telephone_number, presence: true
  
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
  
  def follow(producer)
    self.relationships.find_or_create_by(producer_id: producer.id)
  end
  
  def unfollow(producer)
    self.relationships.find_by(producer_id: producer.id)&.destroy
  end

  def following?(producer)
    self.producers.include?(producer)
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

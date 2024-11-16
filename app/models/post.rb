class Post < ApplicationRecord
    
  belongs_to :producer
  belongs_to :item
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  has_one_attached :image
  
  validates :title, presence: true
  validates :body, length: { minimum: 1, maximum: 100 }
  
  
  def get_image(width, height)
    unless image.attached?
      #file_path = Rails.root.join('app/assets/images/no_image.jpg')
      #image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
      "no_picture.jpg"
    else
      image.variant(resize_to_limit: [width, height]).processed
    end
  end
  
  def self.search
    return Post.all unless search
    Post.where(['content LIKE(?) OR title LIKE(?)', "%#{search}", "%#{search}"])
  end
  
  def favorited_by?(consumer)
    favorites.exists?(consumer_id: consumer.id)
  end
end

# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  body        :text
#  title       :string           not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer          not null
#  producer_id :integer          not null
#
# Indexes
#
#  index_posts_on_item_id      (item_id)
#  index_posts_on_producer_id  (producer_id)
#

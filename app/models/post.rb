# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  photo       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  validates :photo, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :post_likes, dependent: :destroy

  mount_uploader :photo, PhotoUploader

  def liked_by_user?(user)
    post_likes.find_by(user: user)
  end
end

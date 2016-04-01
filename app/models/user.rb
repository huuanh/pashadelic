class User < ActiveRecord::Base
  has_secure_password

  has_many :images

  before_save { self.email = email.downcase }

  validates :username, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\Z/ }, uniqueness: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence:true, length: { minimum: 6 }

  def total_images
    Image.where(user: self).count
  end

  def followed?(current_user)
    Follow.where(user: current_user, follow_id: self.id).count > 0
  end

  def count_followers
    Follow.where(follow_id: self.id).count
  end

  def liked?(image)
    Liked.where(user: self, image: image).count > 0
  end

  def avatar_url
    if self.avatar != ''
      self.avatar
    else
      'http://photos.pashadelic.com/user/image/129369/mit.jpeg'
    end
  end
end

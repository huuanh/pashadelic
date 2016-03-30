class Image < ActiveRecord::Base
  mount_uploader :img_url, ImageUploader

  belongs_to :category
  belongs_to :user

  validate :image_size_validation

  def total_like
    Liked.where(image: self).count
  end

  def total_comment
    Comment.where(image: self).count
  end

  private
  def image_size_validation
    errors[:image] << "should be less than 1MB" if img_url.size > 1.megabytes
  end
end

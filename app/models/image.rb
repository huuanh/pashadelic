class Image < ActiveRecord::Base
  mount_uploader :img_url, ImageUploader

  belongs_to :category
  belongs_to :user

  validate :image_size_validation

  private
  def image_size_validation
    errors[:image] << "should be less than 500KB" if img_url.size > 0.5.megabytes
  end
end

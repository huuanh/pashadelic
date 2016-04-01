class Image < ActiveRecord::Base
  mount_uploader :img_url, ImageUploader

  belongs_to :category
  belongs_to :user
  has_many :comments
  has_many :liked

  validate :image_size_validation

  scope :created_at_desc, -> {order('created_at DESC')}
  scope :created_at_asc, -> {order('created_at ASC')}

  def total_like
    self.liked.count
  end

  def total_comment
    self.comments.count
  end

  def direct_children_comments(level, parent_id)
    @comments = self.comments.select { |comment| comment.level == level && comment.parent_id == parent_id }
  end

  private
  def image_size_validation
    errors[:image] << "should be less than 40MB" if img_url.size > 40.megabytes
  end
end

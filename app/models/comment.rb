class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image

  scope :level_0, -> {where(level: 0)}
end

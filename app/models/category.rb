class Category < ActiveRecord::Base
  has_permalink

  validates :permalink, presence: true, uniqueness: true
end

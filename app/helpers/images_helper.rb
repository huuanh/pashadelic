module ImagesHelper
  def six_images(user)
    Image.where(user: user).last(6)
  end
end

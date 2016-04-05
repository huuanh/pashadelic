module ImagesHelper
  def six_images(user)
    Image.where(user: user).last(6)
  end

  def photos_of_days
    photos = []
    if Image.first
      time1 = Image.first.created_at.beginning_of_day
      time2 = (Image.last.created_at + 1.day).beginning_of_day
      while time1 < time2
        photos << Image.where(created_at: time1..(time1 + 1.day)).sort{ |l,r| r.liked.count <=> l.liked.count }.first
        time1 = time1 + 1.day
      end
    end
    photos
  end

  def photos_of_months
    photos = []
    if Image.first
      time1 = Image.first.created_at.beginning_of_month
      time2 = (Image.last.created_at + 1.month).beginning_of_month
      while time1 < time2
        photos << Image.where(created_at: time1..(time1 + 1.month)).sort{ |l,r| r.liked.count <=> l.liked.count }.first
        time1 = time1 + 1.month
      end
    end
    photos
  end
end

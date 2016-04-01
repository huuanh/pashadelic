class WelcomeController < ApplicationController
  def index
  end

  def popular
    @images = Image.created_at_asc
  end

  def upcoming
    @images = Image.created_at_desc
  end

  def photos_of_days
  end

  def photos_of_months
  end
end

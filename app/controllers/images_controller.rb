class ImagesController < ApplicationController
  before_action :set_image, only: [:show, :edit, :update, :destroy, :like]

  def index
    @images = Image.all
  end

  def show
  end

  def new
    @image = Image.new
  end

  def edit
  end

  def create
    @image = Image.new(image_params)
    if current_user
      @image.user = current_user
    end

    respond_to do |format|
      if @image.save
        format.html { redirect_to @image, notice: 'Image was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @image.update(image_params)
        format.html { redirect_to @image, notice: 'Image was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
    end
  end

  def search
    @query = params[:query]
    @images = Image.where('description LIKE ?', "%#{params[:query]}%").paginate(:page => params[:page], :per_page => 9)
  end

  def like
    if Liked.where(user: current_user, image: @image).count > 0
      Liked.where(user: current_user, image: @image).first.destroy
    else
      Liked.create(user: current_user, image: @image)
    end
  end

  private
    def set_image
      @image = Image.find(params[:id])
    end

    def image_params
      params.require(:image).permit(:category_id, :img_url, :description)
    end
end

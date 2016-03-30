class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :about, :collection, :followers, :followings]

  def index
    @users = User.all
  end

  def show
    @images = Image.where(user: @user)
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  def collection
  end

  def about
  end

  def followers
  end

  def followings
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :visible, :admin)
    end
end

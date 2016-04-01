class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit]
  def create
    @comment = Comment.new(comment_params)
    @comment.user = User.find(params[:user])
    @comment.image = Image.find(params[:image])
    if @comment.save
      respond_to do |format|
        format.js
      end
    end
  end

  def new_reply
    @comment = Comment.new
    @comment.parent_id = params[:id]
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create_reply
    @comment = Comment.new(comment_params)
    parent_comment = Comment.find(params[:id])
    @comment.parent_id = parent_comment.id
    @comment.level = parent_comment.level + 1
    @comment.image = parent_comment.image
    @comment.user = current_user

    @comment.save

    respond_to do |format|
      format.js
    end
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

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

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end

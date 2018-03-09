class CommentsController < ApplicationController

  def index
    @prayer = Prayer.find(params[:prayer_id])
    @comment = @prayer.all_comments
  end

  def create
    prayer = Prayer.find(params[:prayer_id])
    comment = Comment.new(comment_params)
    comment.commenter = current_user
    if comment.save
      flash[:notice] = "Successfully posted a prayer"
    else
      flash[:alert] = comment.errors.full_messages.to_sentence
    end
    redirect_to prayer_path(prayer)
  end

  def edit
    @prayer = Prayer.find(params[:prayer_id])
    @comment = Comment.find(params[:id])
  end 

  def update
    prayer = Prayer.find(params[:prayer_id])
    comment = Comment.find(params[:id])
    
    if comment.update(comment_params)
      flash[:notice] = "Successfully posted a prayer"
      redirect_to prayer_path(prayer)
    else
      flash[:alert] = comment.errors.full_messages.to_sentence
      redirect_to prayer_comment_path(prayer,comment)
    end
  end 

  def destroy
    prayer = Prayer.find(params[:prayer_id])
    comment = Comment.find(params[:id])
    comment.destroy
    flash[:notice] = "Comment was deleted"
		redirect_to prayer_path(prayer)
  end 

  private

  def comment_params
    params.require("comment").permit(:prayer_id, :content)
  end

end
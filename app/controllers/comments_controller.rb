class CommentsController < ApplicationController

  def index

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

  end 

  def update

  end 

  def destroy

  end 

  private

  def comment_params
    params.require("comment").permit(:prayer_id, :content)
  end

end
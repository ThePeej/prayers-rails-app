class GroupCommentsController < ApplicationController 
  before_action :authenticate_user!

  def create
    @group = Group.find(params[:group_id])
    @group_comment = GroupComment.new(group_comment_params)
    @group_comment.commenter = current_user
    if @group_comment.save
      flash[:notice] = "Successfully posted a comment"
    else
      flash[:alert] = @group_comment.errors.full_messages.to_sentence
    end
    redirect_to group_path(@group)
  end


  private

    def group_comment_params
    params.require("group_comment").permit(:group_id, :content)
  end

end
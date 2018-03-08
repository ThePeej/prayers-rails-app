class GroupsController < ApplicationController

  def index
    @groups = Group.all_public
  end

  def show
    @group = Group.find(params[:id])
    @prayers = @group.prayers.sort.reverse
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    group.leader = current_user
    group.members << current_user
    

    if group.save
      flash[:notice] = "Successfully started a new prayer group"
      redirect_to group_path(group)
    else
      flash[:alert] = group.errors.full_messages.to_sentence
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      flash[:notice] = "Successfully updated prayer group"
      redirect_to group_path(group)
    else
      flash[:alert] = group.errors.full_messages.to_sentence
      redirect_to new_group_path
    end
  end 

  def destroy
    group = Group.find(params[:id])
    group.destroy
		flash[:notice] = "Group was deleted"
		redirect_to groups_path
  end

  private

  def group_params
    params.require("group").permit(:name, :description, :is_public)
  end

end

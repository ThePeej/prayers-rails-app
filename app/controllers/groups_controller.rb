class GroupsController < ApplicationController

  def index
    @groups = Group.all
  end

  def show
    @group = Group.find(params[:id])
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
      redirect_to groups_path
    else
      flash[:alert] = "Prayer group requires a name"
      redirect_to new_group_path
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update

  end 

  def delete
    @group = Group.find(params[:id])
  end

  private

  def group_params
    params.require("group").permit(:name, :description, :is_public)
  end

end

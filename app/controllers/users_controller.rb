class UsersController < ApplicationController
  def index
    if params[:approved] == "false"
      @users = User.where(approved: false)
    else
      @users = User.all
    end
  end

  def active
    @user = User.find(params[:id])
    @user.update approved: true
    redirect_to users_path
  end

  def inactive
    @user = User.find(params[:id])
    @user.update approved: false
    redirect_to users_path
  end
 


end

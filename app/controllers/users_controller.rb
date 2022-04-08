class UsersController < ApplicationController
  def active
    @user = User.find(params[:id])
    @user.update approved: true
    redirect_to admin_users_path
  end

  def inactive
    @user = User.find(params[:id])
    @user.update approved: false
    redirect_to admin_users_path
  end
end

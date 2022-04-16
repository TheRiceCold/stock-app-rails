class UsersController < ApplicationController
  def active
    @user = User.find(params[:id])
    if @user.update approved: true
      redirect_to admin_users_path
      #send email here
    end
  end

  def inactive
    @user = User.find(params[:id])
    @user.update approved: false
    redirect_to admin_users_path
  end
end

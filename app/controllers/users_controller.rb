class UsersController < ApplicationController
  def active
    @user = User.find(params[:id])
    if @user.update approved: true
      UserApprovalEmailMailer.with(user: @user).userapproved.deliver_later
      flash[:success] = "You have been activated #{@user.email}"
      redirect_to admin_users_path
    end
  end

  def inactive
    @user = User.find(params[:id])
    if @user.update approved: false
      InactivateUserMailer.with(user: @user).inactiveuser.deliver_later
      flash[:success] = "You have been deactivated #{@user.email}"
      redirect_to admin_users_path
    end
  end
end

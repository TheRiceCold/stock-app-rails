class UsersController < ApplicationController
  def active
    @user = User.find(params[:id])
    if @user.update approved: true
      UserApprovalEmailMailer.with(user: @user).userapproved.deliver_later

      redirect_to admin_users_path
      flash[:success] = "You have been activated #{@user.email}"
      #send email here
    end
  end

  def inactive
    @user = User.find(params[:id])
    if @user.update approved: false
      redirect_to admin_users_path
      flash[:success] = "You have been deactivated #{@user.email}"

    end
  end
end

class UserApprovalEmailMailer < ApplicationMailer
    def userapproved
        @user = params[:user]
    
        mail(to: @user.email , subject: "You have been approved by admin!")
    end
    # def userdisapproved
    #     @user = params[:user]
    
    #     mail(to: @user.email , subject: "You have been deactivated by admin!")
    # end
end

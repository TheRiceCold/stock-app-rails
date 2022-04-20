class InactivateUserMailer < ApplicationMailer
    def inactiveuser
        @user = params[:user]
    
        mail(to: @user.email , subject: "You have been deactivated by admin!")
    end
end

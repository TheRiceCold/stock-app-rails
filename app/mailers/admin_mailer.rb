class AdminMailer < ApplicationMailer
    def new_user_waiting_for_approval(email)
        @email = email
        mail(to: 'quevonmontojo@gmail.com', subject: 'New user awaiting admin approval')
      end
end

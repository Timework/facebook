class UserMailer < ApplicationMailer
    default from: 'timework.bibo@gmail.com'
    def welcome_email(user)
        @user = user
        mail(to: @user.email, subject: 'Thank you for signing up')
    end
end

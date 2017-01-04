class UserMailer < ApplicationMailer
  default from: "from@example.com"
  layout "account_activation"

  
  def account_activation(user)
    @user = user
    mail to: user.email, subject: "Account activation"
  end

  
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

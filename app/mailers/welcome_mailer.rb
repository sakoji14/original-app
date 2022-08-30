class WelcomeMailer < ApplicationMailer
  default from: 'notifications@example.com'
  
  def welcome_email
    @user = "hi"
    mail to: "テストメール送信先アドレス"

  end
end

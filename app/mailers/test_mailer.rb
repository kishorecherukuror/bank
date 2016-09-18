class TestMailer < ApplicationMailer
	default from: "anshuman.prusty@gmail.com"

  def greeting_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Email')
  end
end

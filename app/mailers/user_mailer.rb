class UserMailer < ApplicationMailer
	default from: "mail2akkinapalli@gmail.com"

	def user_inform(user)
		@user = user
		mail(:to => @user.email, subject: "Welcome To Bank")
	end
end

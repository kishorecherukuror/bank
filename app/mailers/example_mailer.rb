class ExampleMailer < ApplicationMailer
	default from: "kiranprasadula@gmail.com"

	def sample_email(user)
		@user = user
		mail(to: @user.email, subject: 'Greeting Email')
    end
end

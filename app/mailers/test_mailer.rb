class TestMailer < ApplicationMailer
  default from: "anshuman.prusty@gmail.com"

  #def greeting_email(user)
   # @user = user
    #mail(to: @user.email, subject: 'Welcome Email')
  #end

  def greeting_email(user)
    @user = user

    # Uncomment the following when using mailgun-ruby

    mg_client = Mailgun::Client.new ENV['api_key']

  	message_params = {:from    => ENV['gmail_username'],
                      :to      => @user.email,
  	                  :subject => 'Sample Mail using Mailgun API',
  	                  :text    => 'Mail is sent using Mailgun API via mailgun'}
    binding.pry
  	mg_client.send_message ENV['domain'], message_params

  end

end

class HhMailer < ApplicationMailer
	default from: "habithero2018@gmail.com "
	layout "mailer"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Email') do |format|
        format.text
    end
  end
end

require "action_mailer"
# set which directory ActionMailer should use
ActionMailer::Base.view_paths = File.dirname(__FILE__)

# ActionMailer configuration
ActionMailer::Base.smtp_settings = {
  address:    'smtp.gmail.com',
  port:       '587',
  user_name:  'alvarezjonathansf17@gmail.com',
  password:   'iLike3.14',
  authentication: :plain
}



class Newsletter < ActionMailer::Base
  default from: "from@example.com"
  def email(rec)
    mail(to: rec, subject: 'Welcome to My Awesome Site!')
  end

end

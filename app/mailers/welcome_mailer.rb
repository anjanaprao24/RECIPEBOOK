class WelcomeMailer < ActionMailer::Base
  default from: "anjanaprao24@gmail.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.welcome_mailer.welcome.subject
  #
  def welcome(email,body)
    @greeting = "Welcome"
    @val=body
    @text= Item.where(:id=>@val)
    attachments["food1.png"] = File.read("#{Rails.root}/public/food1.png")  
  mail to: email ,  subject:"Welcome to Recipe Book Site"
 
  end

end

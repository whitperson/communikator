class Emails < ActionMailer::Base
  default from: "whitperson@yahoo.com"

  def welcome(user)
    @user = user #makes user instance variable so it's available in view
    @greeting = "Hi"

    mail to: "whitperson@gmail.com", :subject => "Welcome to Pirate Mail.....Rrrrrrrr"
  end
end
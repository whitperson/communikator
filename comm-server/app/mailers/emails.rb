class Emails < ActionMailer::Base
  default from: "whitperson@gmail.com"

  def email(to, msg)
    @greeting = msg
    mail :to => to
  end
end
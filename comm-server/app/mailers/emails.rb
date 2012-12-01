class Emails < ActionMailer::Base
  default from: "whitperson@yahoo.com"

  def email(to, msg)
    @greeting = msg
    mail :to => to
  end
end
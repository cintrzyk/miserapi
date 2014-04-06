class UserMailer < ActionMailer::Base
  default from: Rails.application.secrets.email
  helper :mailer

  def confirmation_instructions(user, token, opts={})
    @token = token
    mail subject: 'Miser confirmation instructions', to: user.email
  end
end

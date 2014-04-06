module MailerHelper
  def confirmation_link(token)
    link = 'http://' + Rails.application.secrets.api_endpoint + user_confirmation_path + "/#{token}"
    link_to 'Confirm your email', link
  end
end

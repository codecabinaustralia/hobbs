class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.notify_clients.subject
  #
  def notify_clients(client, message)
  	@client = client
  	@message = message

    mail to: @client.email, subject: "New Project Update"
  end
end

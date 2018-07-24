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

  def sign_off_items(project, client, owner)
    @client = client
    @project = project
    @owner = owner

    mail to: @owner.email, subject: "#{@project.title} Stage 1 Complete"
  end

  def variation_request(owner, variation, client, project)
    @client = client
    @project = project
    @owner = owner
    @variation = variation

    mail to: @owner.email, subject: "#{@project.title} Variation Request"
  end

  def items_added(owner, project)
    @project = project
    @owner = owner
    mail to: @owner.email, subject: "#{@project.title} Items Added"
  end

  def items_approved(project, item, owner)
    @project = project
    @owner = owner
    @item = item
    mail to: @owner.email, subject: "Item Approved - #{@item.title}"
  end

end

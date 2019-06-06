class StaticMailer < ApplicationMailer
  default from: ENV['MAIL_JET_DEFAULT_FROM']

  def contact_email(params)
    infos = params["/send-contact-email"]
    @sender = infos[:name]
    @email = infos[:email]
    @message = infos[:message]
    mail(to: ENV['MAIL_JET_DEFAULT_FROM'], subject: "Demande de contact")
  end
end

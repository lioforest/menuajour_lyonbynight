class UserMailer < ApplicationMailer
  default from: ENV['MAIL_JET_DEFAULT_FROM']

  def welcome_email(user)

    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = root_url

    attachments.inline['slider_bg2.jpg'] = File.read("#{Rails.root}/vendor/assets/img/slider_bg2.jpg")

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Menu à Jour !')
  end
end

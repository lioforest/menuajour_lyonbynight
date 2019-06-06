class UserMailer < ApplicationMailer
  default from: 'thplyonbynight@gmail.com'

  def welcome_email(user)

    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = root_url

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Menu à Jour !')
  end
end

class StaticController <ApplicationController
  def index
    @title = "Accueil"
    @steps = [
      {
        image: "menu_icon.svg",
        alt: "un menu",
        title: ["Renseignez", "vos", "produits"],
        message: "Rentrez vos produits en base de donnée"
      },
      {
        image: "edit_icon.svg",
        alt: "une page en cours d'édition",
        title: ["Editez", "votre", "menu"],
        message: "Organisez votre menu selon vos envies"
      },
      {
        image: "print_icon.svg",
        alt: "une imprimante",
        title: ["Imprimez", "et", "partagez"],
        message: "Il ne vous reste plus qu'à imprimer le rendu, et/ou à le partager directement sur le web!"
      }
    ]
  end

  def about
    @title = "A propos de nous"
    @team = [
      {
        firstname: "Lionel",
        title: "Porteur de projet",
        photo: "Lionel.png",
        quote: "La Cuisine, c'est l'envers du décor, là où s'activent les hommes et femmes pour le plaisir des autres..."
      },
      {
        firstname: "Tahina",
        title: "Chef de projet",
        photo: "Tahina.png",
        quote: "La bonne cuisine est la base du véritable bonheur."
      },
      {
        firstname: "Baptiste",
        title: "Intégrateur",
        photo: "Baptiste.png",
        quote: "La programmation c'est comme la nourriture, c'est meilleur avec du rouge."
      },
      {
        firstname: "Noël",
        title: "Backend master",
        photo: "Noel.png",
        quote: "Ta gueule Tahina !"
      },
      {
        firstname: "Cédric",
        title: "Frontend master",
        photo: "Cedric.png",
        quote: "Le code, c'est comme la cuisine, tout le monde peut en faire. Mais les maîtriser relève de l'art poétique."
      }
    ]
  end

  def contact
    @title = "Contactez-nous"
    @contacts = [
      {
        title: "E-mail",
        icon: "ion-ios-email-outline",
        content: [
          {
            link: "mailto: thplyonbynight@gmail.com",
            name: "thplyonbynight@gmail.com"
          }
        ]
      },
      {
        title: "Téléphone",
        icon: "ion-ios-telephone-outline",
        content: [
          {
            link: "tel:+33 (0)6 11 95 79 79",
            name: "+33 (0)6 11 95 79 79"
          }
        ]
      },
      {
        title: "Réseaux Sociaux",
        icon: "ion-social-twitter-outline",
        content: [
          {
            link: "http://www.facebook.com/#",
            name: "Facebook"
          },
          {
            link: "http://www.instagram.com/#",
            name: "Instagram"
          },
          {
            link: "http://www.twitter.com/#",
            name: "Twitter"
          },
          {
            link: "http://www.linkedin.com/#",
            name: "Linkedin"
          }
        ]
      }
    ]
  end

  def send_contact_email
    StaticMailer.contact_email(params).deliver_now
    redirect_to contact_path + "#form"
  end
end

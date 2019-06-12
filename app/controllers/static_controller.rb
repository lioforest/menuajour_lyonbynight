class StaticController <ApplicationController
  def index
    @title = "Accueil"
    @steps = [
      {
        image: "menu_icon.svg",
        alt: "un menu",
        title: ["Choisissez", "votre", "modèle"],
        message: "Choisissez parmis nos nombreux modèles celui qui vous convient"
      },
      {
        image: "edit_icon.svg",
        alt: "une page en cours d'édition",
        title: ["Editer", "votre", "menu"],
        message: "Personnaliser votre menu selon vos envies"
      },
      {
        image: "print_icon.svg",
        alt: "une imprimante",
        title: ["Imprimer", "et", "partager"],
        message: "Il ne vous reste plus qu'à imprimer le rendu, et/ou à la partager directement sur le web!"
      }
    ]
  end

  def about
    @title = "A propos de nous"
    @team = [
      {
        firstname: "Lionel",
        title: "Porteur de projet",
        photo: "team_photo_1.jpg",
        quote: "J'ai la même définition de l'informatique que Bernard Loiseau a pour la cuisie : \"La Cuisine, c'est l'envers du décor, là où s'activent les hommes et femmes pour le plaisir des autres..."
      },
      {
        firstname: "Tahina",
        title: "Chef de projet",
        photo: "team_photo_2.jpg",
        quote: "Pyjama dans la camion citerne. Tes yeux marrons couleur cochon. Juste eux et nous. La petite vérité perdue."
      },
      {
        firstname: "Baptiste",
        title: "Intégrateur",
        photo: "team_photo_3.jpg",
        quote: "Ce soir le vent, hier tes pleurs. Tu verras, on fera tomber les croix. La nuit je pleure, le jour demain. Un souvenir, tes yeux, on ira bien c'est sûr."
      },
      {
        firstname: "Noël",
        title: "Backend master",
        photo: "team_photo_1.jpg",
        quote: "Pour qui sait sourire à la flânerie. Pâles copies pour piètre dévotion. Les coeurs tanguent mais tes mains consolent. Je déterre les deuils, les armes de déraison."
      },
      {
        firstname: "Cédric",
        title: "Frontend master",
        photo: "team_photo_2.jpg",
        quote: "Je vous assure, React était la solution ! C'est juste la base de données, qui ne pouvait pas être serializier correctement. Sinon l'AJAX, c'est sympa. JS 4 EVA !"
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
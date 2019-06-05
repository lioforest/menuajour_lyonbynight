class StaticController <ApplicationController
  def index
    @title = "Accueil"
  end

  def about
    @title = "A propos de nous"
    @team = [
      {
        firstname: "Lionel",
        title: "Porteur de projet",
        photo: "team_photo_1.jpg",
        quote: "Les écorchures entament nos tendons. Que les pièges qu’on actionne cachent sous terre nos vrais et pieux démons. Accueille les peurs sublimées. Ils respirent comme ils mentent."
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
        quote: "Je vous assure, React est la solution !"
      }
    ]
  end
end

class ApplicationController < ActionController::Base
  before_action :get_footer_link

  def get_footer_link
    @socials = [
      {
        icon: "fab fa-facebook fa-2x",
        link: "http://www.facebook.com/#"
      },
      {
        icon: "fab fa-linkedin fa-2x",
        link: "http://www.linkedin.com/#"
      },
      {
        icon: "fab fa-twitter fa-2x",
        link: "http://wwww.twitter.com/#"
      },
      {
        icon: "fab fa-instagram fa-2x",
        link: "http://www.instagram.com/#"
      }
    ]

    @supports = [
      {
        route: "/about.html",
        text: "A propos de nous"
      },
      {
        route: "#",
        text: "Nous contacter"
      },
      {
        route: "#",
        text: "Tarifs"
      },
      {
        route: "#",
        text: "CGU"
      },
      {
        route: "#",
        text: "Mentions Légales"
      }
    ]
  end
end

class ApplicationController < ActionController::Base
  before_action :get_footer_link
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
  end

  def get_footer_link
    @email = "thplyonbynight@gmail.com"
    @phone = "+33 (0)6 11 95 79 79"
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
        route: a_propos_path,
        text: "A propos de nous"
      },
      {
        route: contact_path,
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

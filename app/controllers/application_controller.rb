class ApplicationController < ActionController::Base
  before_action :get_footer_link
  before_action :configure_devise_parameters, if: :devise_controller?

  def configure_devise_parameters
    devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation)}
    devise_parameter_sanitizer.permit(:account_update) {|u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password)}
  end

  def get_footer_link
    @email = "contact@menuajour.com"
    @phone = "+33 (0)6 11 95 79 79"
    @socials = [
      {
        icon: "fab fa-facebook fa-2x",
        link: "https://www.facebook.com/menuajour"
      },
      {
        icon: "fab fa-linkedin fa-2x",
        link: "https://www.linkedin.com/company/menuajour/"
      },
      {
        icon: "fab fa-twitter fa-2x",
        link: "https://twitter.com/menuajour"
      }
    ]

    @supports = [
      {
        route: a_propos_path,
        text: "À propos de nous"
      },
      {
        route: contact_path,
        text: "Nous contacter"
      },
      {
        route: notre_offre_path,
        text: "Notre offre"
      },
      {
        route: en_cours_path,
        text: "CGU"
      },
      {
        route: en_cours_path,
        text: "Mentions Légales"
      }
    ]
  end

  def create_subscriber
    new_sub = Subscription.new(name: 'Offre Impression Illimitée', price: 100, start_date: Date.today, end_date: (Date.today + 366), user: current_user)
      if new_sub.save
        flash[:success] = 'Votre paiement a bien été prit en compte'
      else
        flash[:error] = 'Suite à un problème, votre paiement n\'a pas été prit en compte'
      end
  end

  def is_subscribed_user?

    if current_user.subscriptions.last != nil
      if current_user.subscriptions.last.end_date > Date.today
        return true
      end
  end
    
  end

end

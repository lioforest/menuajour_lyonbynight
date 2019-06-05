class StaticController <ApplicationController
  def index
    @title = "Accueil"
  end

  def about
    @title = "A propos de nous"
  end
end

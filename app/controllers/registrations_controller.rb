class RegistrationsController < Devise::RegistrationsController
  def new
    super
    @title = "S'enregistrer"
  end

  def edit
    super
    @title = "Modifier mon profil"
  end
end
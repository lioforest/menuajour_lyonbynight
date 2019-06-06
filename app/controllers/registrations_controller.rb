class RegistrationsController < Devise::RegistrationsController
  def new
    @title = "S'enregistrer"
  end
end
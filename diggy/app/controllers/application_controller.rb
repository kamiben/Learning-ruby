class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :fetch_logged_in_user # Filtre : la méthode mise en lien sera systématiquement effectuée avant chaque appel de controlleur
  
  protected # Eviter un acces public à cette méthode
  
  def fetch_logged_in_user
    return unless session[:user_id] # Teste si le cookie de session est présent et contient un user_id (un utilisateur est donc connecté)
    @current_user = User.find_by_id(session[:user_id]) # Récupère l'objet user via son id, il sera maintenant dispo pour le controlleur appelé
  end 
end

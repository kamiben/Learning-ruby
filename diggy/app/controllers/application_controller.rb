class ApplicationController < ActionController::Base
 # protect_from_forgery
  
  before_filter :fetch_logged_in_user # Filtre : la méthode mise en lien sera systématiquement effectuée avant chaque appel de controlleur
  
  protected # Eviter un acces public à cette méthode
  
  def fetch_logged_in_user
    return unless session[:user_id] # Teste si le cookie de session est présent et contient un user_id (un utilisateur est donc connecté)
    @current_user = User.find_by_id(session[:user_id]) # Récupère l'objet user via son id, il sera maintenant dispo pour le controlleur appelé
  end 
  
  
# Méthode pour vérifier si un utilisateur est enregistré 
  def logged_in? 
    ! @current_user.nil?
  end
  helper_method :logged_in? #On caractérise cette méthode comme helper : cela va permettre de l'utiliser de partout dans l'application 
  
  
#Méthode qui permet de forcer la connexion
  def login_required
    return true if logged_in? # renvoie vrai si connecté 
    session[:return_to] = request.request_uri # Envoie en parametre la page d'origine pour qu'il soit redirigé apres sa connexion
    redirect_to new_session_path and return false #sinon redirige pour qu'il puisse se connecter
  end
  
end

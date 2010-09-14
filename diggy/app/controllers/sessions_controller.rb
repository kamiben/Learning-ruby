class SessionsController < ApplicationController
  def new
  end

# Méthode pour valider l'enregistrement d'un utilisateur
  def create
    @current_user = User.find_by_login_and_password(
    params[:login], params[:password]) # essaie d'attribuer a l'objet user un user qui correspond au login et mdp dans la base
    if @current_user # L'utilisateur est trouvé
      session[:user_id] = @current_user.id # on stocke dans son cookie son id utilisateur et on le redirige vers l'index
      redirect_to stories_path
    else
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    @current_user = nil # suppression des infos de session en local et sur le browser distant
  end

end

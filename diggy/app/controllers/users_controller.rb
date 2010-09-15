class UsersController < ApplicationController

  def show
    @user = User.find(params[:id]) # on retrouve l'objet utilisateur
    @stories_submitted = @user.stories.find(:all, # ses histoires proposées
      :limit => 6, :order => 'stories.id DESC') #renvoie 6, rangées par id
    @stories_voted_on  = @user.stories_voted_on.find(:all, # ses histoires votées
      :limit => 6, :order => 'votes.id DESC')
  end

end

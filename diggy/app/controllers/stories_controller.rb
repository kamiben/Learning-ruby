class StoriesController < ApplicationController
  def index # Renvoie une story aléatoire à la vue pour affichage en utilisant la classe Story (<activerecord)
    @story = Story.find(:first, :order => 'RANDOM()') #:order peut prendre ASC, DESC, ou RANDOM()
  end

  def new  # Création d'une nouvelle story, nécéssaire pour que la vue aie un objet ou stocker ses données.
    @story = Story.new
  end
  
  def create # Appelé lors du post sur la vue new, enregistre les données
    @story = Story.new(params[:story]) # récupère les parametres envoyés par post, on filtre ceux qui sont utile (:story)
    if @story.save # enregistre la nouvelle story dans la base de données, et renvoie un flash de succès
    	flash[:notice] = 'Story submission succeeded'
    	redirect_to stories_path # redirection vers l'index une fois l'enregistrement effectué, le flash sera dessus
    else
      render :action => 'new' # Genere a nouveau la vue avec les anciens parametres, pour que l'utilisateur ne les rentre pas à nouveau
    end
  end
  
  #Show: affiche une story en particulier
  def show
    @story = Story.find(params[:id]) # place dans l'objet @story accessible par la vue les infos de la story[id]
  end
end

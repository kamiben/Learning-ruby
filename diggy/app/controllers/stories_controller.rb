class StoriesController < ApplicationController

  before_filter :login_required, :only => [:new, :create] # On applique le filtre pour forcer la connexion uniquement sur les pages new et create
  def index # Renvoie les story avec plus de 5 votes à la vue pour affichage en utilisant la classe Story (<activerecord)
    fetch_stories 'votes_count >= 5' #:order peut prendre ASC, DESC, ou RANDOM()
  end

  def new  # Création d'une nouvelle story, nécéssaire pour que la vue aie un objet ou stocker ses données.
    @story = Story.new
  end
  
  def create # Appelé lors du post sur la vue new, enregistre les données
    @story = @current_user.stories.build (params[:story]) # stocke l'histoire d'un user en récupèrant les parametres envoyés par post, on filtre ceux qui sont utile (:story)
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
  
  #bin : implémente une page pour les story ayant peu de votes
  def bin
    fetch_stories 'votes_count < 5'
    render :action => 'index' # Va utiliser le meme template qu'index (au final on affiche la meme chose avec des story différentes)
  end
  
  
  protected
  # fetch_stories : récupère les story répondant aux conditions (parametre sql)
  def fetch_stories(conditions)
    @stories= Story.find :all, 
      :order => 'id DESC', 
      :conditions => conditions
  end
end

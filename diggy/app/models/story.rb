class Story < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :name, :link #Validation de la présence des paramètres name et link. Sans cette validation il était possible d'entrer un enregistrement sans nom ou lien
  has_many :votes do
    def latest
      find :all, :order => 'id DESC', :limit => 3
    end
  end
  
  # Ecrase la méthode par défaut de gestion des liens pour la création de liens jolis contenant le nom de la story
  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
  

  
end

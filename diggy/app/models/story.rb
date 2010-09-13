class Story < ActiveRecord::Base
  validates_presence_of :name, :link #Validation de la présence des paramètres name et link. Sans cette validation il était possible d'entrer un enregistrement sans nom ou lien
  has_many :votes
  
  # Ecrase la méthode par défaut de gestion des liens pour la création de liens jolis contenant le nom de la story
  def to_param
    "#{id}-#{name.gsub(/\W/, '-').downcase}"
  end
end

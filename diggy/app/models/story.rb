class Story < ActiveRecord::Base
  validates_presence_of :name, :link #Validation de la présence des paramètres name et link. Sans cette validation il était possible d'entrer un enregistrement sans nom ou lien
  has_many :votes
end

#!/usr/bin/env ruby

# fichier d'aide concernant les concepts de POO de Ruby
# auteur : Cirsium
# créé le 07-09-2010
# dernière édition le 12-09-2010

# notes de mise à jour :
		# néant

module ModTest # sorte de classe qui ne peut pas être instanciée
	
	def mon_id
		puts self.object_id
	end
	
end

class EtreVivant
	include ModTest # intégration du module ModTest dans la classe
	
	def coeur_bat
		puts "It's Aliiiiive !"
	end
	
end

class Animal<EtreVivant # la classe Animal hérite de la classe EtreVivant
	@@total_cree = 0 # variable de classe
	attr_accessor :parle, :age # création des variables d'instance ainsi que de leurs accesseurs (set et get) | attr_reader si seulement accès en lecture et attr_writer si seulement accès en écriture

	public # à partir de là, tout est public, jusqu'à ce qu'on mette private. tout ce qui suivra alors sera privé.
	
	def initialize(parle = ". . .", age = 0) # constructeur
		@@total_cree += 1
		@parle = parle # variable d'instance
		@age = age
	end

	def self.total # self fait référence à la classe elle-même
		return @@total_cree
	end

#	def set_age(age) # accesseur set
#		@age = age
#	end
	
#	def get_age # accesseur get
#		return @age
#	end
	
	def parle=(parole) # variante de l'accesseur set
		@parole = parole
	end

	def parle # variante de l'accesseur get
		return @parole
	end

end

#--------------------
#----- redéfinition d'une méthode pour un objet spécifique (méthode singleton)
class Gus
	def taille
		puts "De grande taille"
	end
end

paul = Gus.new
jacques = Gus.new

def jacques.taille
	puts "Tout petit petit"
end

jacques.taille
paul.taille
#--------------------

if __FILE__ == $0

#puts "Nb d'animaux crees : #{Animal.total}" # on appelle la variable de classe depuis la classe et non une instance de cette classe
#cochon = Animal.new("groin groin", 15) # si on omet les paramètres, les valeurs par défaut sont utilisées
#puts "le cochon fait #{cochon.parle} et il a #{cochon.age} ans." # accesseur get
#cochon.parle = "grouink" # accesseur set
#cochon.age= 12
#puts "le cochon fait #{cochon.parle} et il a #{cochon.age} ans."
#puts "Nb d'animaux crees : #{Animal.total}"
#chien = Animal.new
#puts "Nb d'animaux crees : #{Animal.total}"

#cochon = Animal.new
#cochon.coeur_bat # la classe Animal hérite bien des méthodes de la classe EtreVivant

#machin = EtreVivant.new
#machin.mon_id # la classe EtreVivant hérite bien des méthodes du module ModTest

end

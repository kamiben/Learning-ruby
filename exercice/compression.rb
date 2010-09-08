#!/usr/bin/env ruby

# fichier d'exercice : il s'agit d'implémenter un algorithme de compression
# auteur : Kamiben
# créé le 08-09-2010
# dernière édition le 08-09-2010
# commentaires sur l'exerice
# 1. Il vaudrait mieux que j'ouvre et ferme le fichier pour en lire le contenu, et refaire une opération I/O une fois que je veux écrire
# 2. Une fois les principes du décodage compris et que l'encodage marche, pas forcément la peine de l'écrire
# 3. Possible de faire plus court ?
# 4. Du coup j'ai du mal a voir l'interet de la poo sur cet exercice particulier

if __FILE__ == $0 


class Compression  # Pour rester dans une optique exercice, je crée une classe dédiée à la compression

	def initialize (trigger,nomfichier)
		@trigger = trigger
		@nomfichier = nomfichier
	end
	
	
	def ouvrir
	  	begin
			@fichier = File.open(@nomfichier, "r+")
	  	rescue
			puts "Le fichier n'a pas pu être ouvert, veuillez relancer le programme avec un nom de fichier correct"
	    end
	end
	
	def fermer 
		@fichier.close
	end
	
	def compression
		
		case @trigger
			when "-c"#on compresse
			
			lignecompresse =""
				@fichier.each_line do |ligne| # parcourir toutes les lignes
				
					tailleligne = ligne.length
				
  					puts "compression en cours..."
  					until ligne.length ==1 # On s'arrete au dernier caractère, qui sera bien sur tout de meme dans la compression
  					
  						count=1 # initialisation du compteur de caracteres

  						while (ligne[0]==ligne[1] and count !=9) # deux caracteres identiques, on augmente le compteur et on enleve le premier caractere
  							count+=1
  							ligne = ligne.reverse.chop.reverse#supprimer ligne[0]
  						end
  						
  						if ligne[0..0] =="@" 
  							lignecompresse = lignecompresse << "@@"# cas ou on a le flag dans la chaine
  						end
  						if count == 1
  							lignecompresse = lignecompresse << ligne[0..0] # cas ou il n'y a qu'un seul car
  						end
  						if count == 2
  							lignecompresse = lignecompresse << ligne[0..0]*2 # cas ou il y a deux car
  						else
  							lignecompresse = lignecompresse << count.to_s << "@"<< ligne[0..0] # créer la nouvelle chaine compressée
  						end
  						
  						ligne =  ligne.reverse.chop.reverse #supprimer le caractère traité
  						
  					end
  					
  					gain = lignecompresse.length.to_f / tailleligne.to_f * 100
  					puts "compression terminee sans erreurs: taux de compression = #{gain.to_i.to_s} %"
  					
  					
  				
  					 
  					
  					
				end
				
				@fichier.rewind # revenir au début du fichier
				@fichier.truncate(0) # nettoyer le fichier
				lignecompresse.each {|x| 
  					@fichier << x+"\n" # remplir le fichier par le code compresse
  				}
				

				
			when "-d"#on décompresse
				#lignedecompresse =""
				#@fichier.each_line do |ligne| # parcourir toutes les lignes
					#until ligne.length ==1
						# 1 char isolé
						
						# 2 char isolé
						# @@
						# x@z
						#ligne =  ligne.reverse.chop.reverse
					#end
				#end
				
				#pas envie de le faire :)
			else
				puts "Aucun argument valide recu, utilisation : ruby compression.rb -c/-d nomdefichier"
		end
	end
end

outilcompression = Compression.new(ARGV[0], ARGV[1])
outilcompression.ouvrir
outilcompression.compression
outilcompression.fermer

end
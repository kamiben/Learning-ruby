#!/usr/bin/env ruby

# fichier d'aide concernant la syntaxe et les structures de base de Ruby
# auteur : Cirsium
# créé le 07-09-2010
# dernière édition le 08-09-2010

if __FILE__ == $0 #teste si le programme est bien lancé à partir de ce fichier (exemples d'utilisation sur des librairies)

#----- saisie au clavier en mode console
#saisie = gets # gets attend une chaine entrée par l'utilisateur et validée avec la touche Entrée (Entrée (\n) comprise dans la chaine)
#puts saisie.chomp # la méthode chomp renvoie la chaine sans le retour à la ligne \n
#saisie2 = gets.chomp

#----- utilisation d'une variable dans une chaine de caractères
#nom = 'Paul'
#puts "Bonjour #{nom}"

#----- création d'un tableau
#monTableau = ["a", 12, "b"]
#puts monTableau[1]
#monTableau[1] = 42
#puts monTableau[1]
# diverses méthodes : push, pop, last, sort

#----- création de tableau associatif (hash)
#monHash = {:nom => "Smith", :prenom => "John"}
#puts monHash[:nom]

#----- manipulation de chaine, tableau et hash
#maVar = 'azerty'
#puts maVar[0] # 1er élément (indice 0) affiché
# [0..0] : 1er élément (indice 0) | [0..3] : éléments d'indices 0 à 3 inclus | [0,4] : à partir de l'indice 0, longueur de 4 | [-2, 2] : Deuxième élément à partir de la fin, longueur de 2 || toutes ces chaines sont retournées dans un tableau
#maDate = "07/09/2010"
#monTab = maDate.split('/') # équivalent explode de php. Coupe la chaine avec le séparateur spécifié
#maDate = monTab.join('-') # équivalent de implode de php. Assemble en une chaine les parties d'un tableau avec le séparateur spécifié
#puts maDate

#--------------------
#----- convention de nommage
#nom_var
#nom_methode
#nom_methode? (si renvoie true ou false)
#nom_methode! (méthode destructrice, qui modifie la variable)
#@nom_var_instance
#@@nom_var_classe
#$nom_var_globale (s'écrit aussi en majuscule)
#NomClasse
#NOMCONSTANTE ou NomConstante
#--------------------

#----- if... elseif... else... end
#nombre = gets.chomp.to_i # to_i convertit si possible une chaine en integer
#if (nombre == 42)
#	puts "bonne reponse"
#else
#	puts "mauvaise reponse"
#end

#----- case... end
#nombre = gets.chomp.to_i
#case nombre
#	when 0..9
#		puts "nombre compris entre 0 et 9"
#	when 42
#		puts "bravo"
#	else
#		puts "nombre trop grand"
#end

#----- unles... end
#j = rand(10)
#puts j
#unless (j <= 5) # à moins que (inverse de if)
#	puts "j vaut plus que 5"
#else
#	puts "j vaut moins que 5"
#end

#----- while... end
#i = 0
#while (i < 10)
#	i += 1
#	puts i
#end

#----- until... end
#i = 0
#until (i >= 10) # un while à l'envers
#	i += 1
#	puts i
#end

#----- for... end
#for elt in (1..10)
#	puts elt
#end
# autre exemple avec les éléments d'un tableau
#tab = [1, 2, 3, 4]
#for elt in tab
#	puts elt
#end

#----- each {...}
#tab = [1, 2, 3, 4]
#tab.each do | elt |
#	puts elt
#end

#----- syntaxe alternative
#tab = [1, 2, 3, 4]
#tab.each { | elt |
#	puts elt }

#----- each_byte : parser lun à un les caractères d'une chaine
#chaine = "ayu"
#chaine.each_byte do |carac|
#	ascii_sup = carac + 1
#	puts ascii_sup.chr
#end

#----- each_line : parser ligne par ligne
#chain = "pierre\npaul\njacques"
#i = 1
#chain.each_line do |ligne|
#	puts "#{i} : #{ligne}"
#	i += 1
#end

#----- répétition d'une opération X fois
#5.times do
#	puts "XXX"
#end

#--------------------
#----- sorties de boucles
# return : sort complètement de la boucle et de la méthode qui contient la boucle
# break : sort de la boucle, et continue le code juste après
# next : passe directement à la prochaine itération de la boucle
# redo : re-passe l'itération courante de la boucle
#--------------------

#----- procédures : stocker des blocs de code pour réutilisation à la demande, passage en paramètre à une méthode
#quel_temps = Proc.new do |mon_param|
#	puts "Il fait #{mon_param} aujourd'hui !"
#end
#quel_temps.call "gris"

#--------------------
#----- gestion d'erreurs

#----- begin... rescue... end
#def ouvre_fichier(nom_fichier)
#	begin
#		fichier = File.open(nom_fichier, "r")
#	rescue # on va demander à l'utilisateur d'entrer lui-même le nom du fichier
#		puts "Le fichier n'a pu etre ouvert, saisissez un nom correct"
#		nom_fichier = gets.chomp
#		retry #permet de relancer le bloc. attention : bouclage tant que l'utilisateur n'a pas entré un nom correct
#	end
#end
#ouvre_fichier("Kapoue.txt")

#----- raise
#begin
#	puts "Saisissez ZE nombre"
#	nombre = gets.chomp.to_i
#	if (nombre != 42)
#		raise "Vous etes un minable !"
#	end
#rescue
#	puts "Erreur : #{$!}" # $! est une variable globale qui retourne le dernier message d'erreur
#ensure # Dans tous les cas, cette instruction s'exécutera
#	puts "Ainsi va la vie..."
#end
#--------------------

#--------------------
#----- manipulation de fichiers

#----- création de fichiers et dossiers
#Dir::mkdir("test", 0777) # création d'un répertoire avec droits complets pour tout le monde
#File::new("test/test.txt", "w+")

#----- affichage ligne par ligne avec numéro de ligne
#fichier = File.open("test/test.txt", "r")
#i = 1
#fichier.each_line do |ligne|
#	puts "#{i} - #{ligne}"
#	i += 1
#end
#fichier.close

#----- écrire dans un fichier
#mon_tab = ["Bonjour", "Ravi de vous recontrer", "Comment allez-vous ?"]
#mon_fichier = File.open("test/test.txt", "w")
#mon_tab.each do |elt|
#	mon_fichier.write elt+"\n"
#end
#mon_fichier.close

#----- renommer ou déplacer un fichier
#File::rename("test/test.txt", "test/toto.txt") #renommage. si rép différent pour tot.txt par ex, déplacement du fichier

#----- lister le contenu d'un répertoire et de tous ses sous-répertoires
#class String
#	def liste_rep(espacement = "")	
#		liste_exclus = [".", ".."]
#		d = Dir.open(self)		
#		liste_dir = d.sort - liste_exclus	
#		liste_dir.each do |fichier|
#			case File.ftype(self+fichier)
#				when "directory"
#					puts "#{espacement} + #{fichier}/"
#					espacement += "     "
#					(self + fichier + "/").liste_rep(espacement)
#					espacement = espacement[0, espacement.length-4]
#				when "file"
#					puts "#{espacement} - #{fichier}"
#				end
#			end
#	end
#end
#"./".liste_rep
#--------------------

#----- méthodes de conversion de classe
# String et Float vers Integer : to_i
# Float et Integer vers String : to_s
# String et Integer vers float : to_f

#----- demander si un objet appartient à une classe particulière : objet.is_a(Classe)
#12.is_a?(Integer)

#----- couper une expression en plusieurs lignes : le dernier caractère de ligne doit être un backslash "\"


end

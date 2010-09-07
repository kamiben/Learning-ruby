#!/usr/bin/env ruby

# fichier d'aide concernant la syntaxe et les structures de base de Ruby
# auteur : Cirsium
# créé le 07-09-2010
# dernière édition le 07-09-2010

if __FILE__ == $0

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

#----- if... else... end
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










end

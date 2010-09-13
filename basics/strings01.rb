#!/usr/bin/env ruby

# fichier d'aide concernant la manipulation des String
# auteurs : Cirsium
# créé le 13-09-2010
# dernière édition le 13-09-2010

# notes de mise à jour
		# néant


if __FILE__ == $0

ch01 = "xABCDEFGHIJKLMNOPQRSTUVWXYZxxx"

puts ch01.slice(0..5) # coupe la chaine et garde les caractères de sindices 0 à 5 (inclus)
puts ch01[0..5] # syntaxe alternative

puts ch01.slice(1,3) # coupe la chaine et garde 5 caractères à partir de l'indice 0
puts ch01[1,3] # syntaxe alternative

puts ch01.insert(1, "x") # insère "x" à l'indice 1 de la chaine. Le reste e la chaine est décalé
ch01[1] = "x" #  insère "x" à l'indice 1 de la chaine et écrase le précédént caractère à cet indice. Le reste de la chaine est décalé si aux moins deux caractères insérés
puts ch01

puts ch01["IJK"] # je ne vois pas l'intérêt, peut-être pour des comparaisons...

ch_out = ch01.delete "x", "v-z" # supprime le caractère précisé. le second paramètre (facultatif) indique le range de validité. utiliser ch01
ch01.delete! "x" # pour pouvoir agir directement sur la chaine
puts ch_out + " " + ch01

ch02 = "I likE To Mess with STRINGS !"
puts ch02.downcase # met toute la chaine en minuscules
puts ch02.upcase # met toute la chaine en majuscules
puts ch02.swapcase # les minuscules deviennent des majuscules et inversement
puts ch02.capitalize # premier caractère en majuscules, le reste en minuscules
puts ch02.squeeze # remplace les doubles caractères par un caractère unique (ici le double s de mess par un simple s). on peut préciser en paramètre le caractère à squeezer

ch03 = "A lot of letters\n" 
puts ch03.chomp! # supprime le dernier caractère s'il s'agit d'un des séparateurs suivants : \n \r\n et \r
puts ch03.chop! # suprime le dernier caractère quel qu'il soit. peut prendre une chaine en paramètre : ch03.chop!("ters") -> si la chiane finit par "ters", supprimera "ters"

ch04 = "   Hello you ;-)      "
puts ch04.strip # supprime les espaces en début et fin de chaine (lstrip pour début seulement et rstrip pour fin seulement)

ch05 = "break,it,down,fool!"
puts ch05.split(",") # coupe la chaine avec le séparateur spécifié

ch06 = "999"
puts ch06.to_i + 1 # conversion de la chaine en integer

end

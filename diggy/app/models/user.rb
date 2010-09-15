class User < ActiveRecord::Base
  has_many :stories
  has_many :votes
  has_many :stories_voted_on, # on a deja un has_many stories, alors il faut renommer l'association pour toruver les votes d'un user
    :through => :votes, # via la table vote
    :source => :story # on retrouve les story sur lesquelles il a voté
end

class VotesController < ApplicationController
  def create
    @story = Story.find(params[:story_id]) # On retrouve la bonne story via son id
    @story.votes.create # on lui ajoute un vote
  end

end

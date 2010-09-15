class VotesController < ApplicationController
  before_filter :login_required
  def create
    @story = Story.find(params[:story_id]) # On retrouve la bonne story via son id
    @story.votes.create(:user => @current_user) # on lui ajoute un vote
    
    respond_to do |format| 
      format.html { redirect_to @story } 
      format.js 
    end
  end

end

# Seconde possibilité d'intégration d'ajax avec moins de lignes de code : spécifique rails 3, on peut alors enlever votes.create, et tout ce qui concerne respond to
#<div id="vote_form"> 
#<% form_for [ @story, Vote.new ], :remote => true do |f| %> 
#<%= f.submit 'shove it' %> 
#<% end %> 
#</div>
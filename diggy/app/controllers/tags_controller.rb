class TagsController < ApplicationController
  def show
    @stories = Story.find_tagged_with(params[:id]) # renvoie les stories avec le tag concerné
  end

end

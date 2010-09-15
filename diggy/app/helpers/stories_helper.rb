module StoriesHelper

  def story_list_heading
    story_type = case controller.action_name # Compare action_name qui contient la valeur de l'action controlleur qui appelle la vue
      when 'index' : pluralize(@stories.size,'Story en couverture', 'Stories en couverture')
      when 'bin' : pluralize(@stories.size, 'Story à venir', 'Stories a venir')
    end
    "Showing #{story_type}"
  end

end

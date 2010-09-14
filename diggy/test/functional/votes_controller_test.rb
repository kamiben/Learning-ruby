require 'test_helper'

class VotesControllerTest < ActionController::TestCase
  
  def test_should_accept_vote
    assert stories(:two).votes.empty? # la deuxieme story n'a aucun vote
    post :create, :story_id => stories(:two) # on crée un vote
    assert ! assigns(:story).votes.empty? # on a bien un vote mnt ?
  end
  
  def test_should_render_rjs_after_vote_with_ajax
    xml_http_request :post, :create, :story_id => stories(:two) # simulation de la requete ajax
    assert_response :success
    assert_template 'create'
  end
  
  def test_should_redirect_after_vote_with_http_post
    post :create, :story_id => stories(:two) # simulation de la requete quand aucun ajax dispo
    assert_redirected_to story_path(stories(:two))
  end
end

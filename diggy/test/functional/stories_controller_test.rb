require 'test_helper'

class StoriesControllerTest < ActionController::TestCase
  test "should get index" do # Vérifie s'il est possible d'acceder a l'index de stories
    get :index
    assert_response :success
    assert_template 'index' # Vérifie si c'est le bon template qui est rendu
    assert_not_nil assigns (:story) # Vérifie si l'objet story est bien passé à la vue
  end


def test_should_show_new
 get_with_user :new
 assert_response :success
 assert_template 'new'
 assert_not_nil assigns(:story) 
end 

def test_should_show_new_form # Vérifie la présence de form dans lequel il y a 3 <p>
 get_with_user :new
 assert_select 'form p', :count => 3 
end 

def test_should_add_story
 post_with_user :create, :story => { # simule un envoi de données
 :name => 'test story',
 :link => 'http://www.test.com/'
 }
 assert ! assigns(:story).new_record? # l'enregistrement est bien validé (doit etre a false donc)'
 assert_redirected_to stories_path # Je me suis bien fait redirigé au bon endroit
 assert_not_nil flash[:notice] # Le flash de validation est bien validé
end 

def test_should_reject_missing_story_attribute #
 post_with_user :create, :story => { :name => 'story without a link' }
 assert assigns(:story).errors.on(:link) 
end 

  def test_should_show_story
    get :show, :id => stories(:one) # methode get pour récuperer la premiere story 
    assert_response :success
    assert_template 'show' # verifie que le bon template est utilisé
    assert_equal stories(:one), assigns(:story) # verifie que la bonne story est renvoyée
  end
  
  def test_should_show_story_vote_elements
    get :show, :id => stories(:one)
    assert_select 'h2 span#vote_score' # verifie la présence d'un element  span avec l'id vote_score
    assert_select 'ul#vote_history li', :count => 2 # element ul avec l'id vote_history contenant deux elements (les deux votes du test)
    assert_select 'div#vote_form form' # element div avec l'id vote_form avec un form a l'intérieur
  end
  
  
  def test_should_show_story_submitter
    get :show, :id => stories(:one)
    assert_select 'p.submitted_by span', 'patrick'
  end

  def test_should_indicate_not_logged_in
    get :index
    assert_select 'div#login_logout em', 'Not logged in.'
  end

  def test_should_show_navigation_menu
    get :index
    assert_select 'ul#navigation li', 2
  end
  
  def test_should_indicate_logged_in_user
    get_with_user :index
    assert_equal users(:patrick), assigns(:current_user)
    assert_select 'div#login_logout em a', '(Logout)' 
  end
  
  def test_should_redirect_if_not_logged_in
    get :new
    assert_response :redirect
    assert_redirected_to new_session_path
  end

  def test_should_store_user_with_story
    post_with_user :create, :story => {
      :name => 'story with user',
      :link => 'http://www.story-with-user.com/'
    }
    assert_equal users(:patrick), assigns(:story).user
  end
end
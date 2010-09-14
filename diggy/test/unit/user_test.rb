require 'test_helper'

class UserTest < ActiveSupport::TestCase

#test si on a bien le lien entre user et story
  def test_should_have_a_stories_association
    assert_equal 2, users(:patrick).stories.size # le total de story correspond bien à ce qu'on lui a associé dans le fichie test (2)
    assert_equal stories(:two), users(:patrick).stories.first #vérifie si le premier objet correspond bien a celui du fichier test
  end
  
  def test_should_have_a_votes_association
    assert_equal 1, users(:patrick).votes.size
    assert_equal votes(:two), users(:john).votes.first
  end 
 
end

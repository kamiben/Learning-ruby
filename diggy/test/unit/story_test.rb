require 'test_helper'

class StoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  def test_should_not_be_valid_without_name
    s = Story.create(:name =>nil, :link => 'http://www.test.com/')
    assert s.errors.on(:name)
  end

  def test_should_be_valid_without_link
   s = Story.create(:name => 'My test submission', :link => nil)
   assert s.errors.on(:link) 
  end 
  
  def test_should_create_story
    s = Story.create(
    :name => 'My test submission',
    :link => 'http://www.testsubmission.com/')
    assert  s.valid? 
  end 
  
  def test_should_have_a_votes_association
    assert_equal [ votes(:two),votes(:one) ],
    stories(:one).votes # Crée un tableau contenant les deux votes et compare au résultat des votes enregistrés pour l'objet
  end 
  
  def test_should_return_highest_vote_id_first
   assert_equal votes(:one), stories(:one).votes.latest.first # Vérifie si le vote retourné est bien le dernier enregistré
  end
  
  def test_should_return_3_latest_votes
    10.times { stories(:one).votes.create } # crée 10 votes
    assert_equal 3, stories(:one).votes.latest.size # verifie qu'on en renvoie 3
  end
end
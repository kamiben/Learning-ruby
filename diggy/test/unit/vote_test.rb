require 'test_helper'

class VoteTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "test story association" do
    assert_equal stories(:one), votes(:one).story # vérifie que le retour est le meme pour les deux expressions (la story appelée one et l'objet vote appelé one)
  end
  
  def test_should_be_associated_with_user
    assert_equal users(:john), votes(:two).user
  end
end
